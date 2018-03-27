//
//  ViewController.swift
//  ngotest1
//
//  Created by Ankit Deshmukh on 24/03/18.
//  Copyright © 2018 Wayne Corporations Pvt Ltd. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import Firebase
import FirebaseAuth
import FirebaseCore
import SwiftKeychainWrapper

class SignInVC: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var pwdField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.standard.string(forKey: KEY_UID) {
            performSegue(withIdentifier: "goToFeed", sender: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func facebookBtnTapped(_ sender: Any) {
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil
            {
                print(" Ankit: Unable to authenticate with Firebase - \(error)")
            }
            else if result?.isCancelled == true {
                print("Ankit: User cancelled facebook authentication")
            }
            else
            {
                print("Ankit: Successfully authenticated")
                let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
    }
    
    func firebaseAuth(_ credential: AuthCredential) {
        Auth.auth().signIn(with: credential, completion: { (user, error) in
            if error != nil
            {
                print("Ankit: Unable to authenticate with firebase -\(error)")
            }
            else
            {
                print("Ankit: Successfully Authenticated!!")
                if let user = user {
                    self.completeSignIn(id: user.uid)
                }
                
            }
        })
    }
    @IBAction func signInTapped(_ sender: Any) {
        
        if let email = emailField.text, let password = pwdField.text {
            Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                if error == nil{
                    print("Ankit: email User authenticated with firebase")
                    if let user = user {
                        self.completeSignIn(id: user.uid)
                    }
                } else {
                    Auth.auth().createUser(withEmail: email, password: password, completion: {(user,error) in
                        if error != nil
                        {
                            print("Ankit: Unable to authenticate user with email")
                        } else {
                            print("Ankit: Successfully authenticated with Email Firebase")
                            if let user = user {
                                self.completeSignIn(id: user.uid)
                            }
                        }
                    })
                }
            })
        }
    }
    
    func completeSignIn(id: String) {
        let keychainResult = KeychainWrapper.standard.set(id, forKey: KEY_UID)
        print("Ankit: Data saved to Keychain \(keychainResult)")
        performSegue(withIdentifier: "goToFeed", sender: nil)
    }
}

