//
//  FeedVC.swift
//  ngotest1
//
//  Created by Ankit Deshmukh on 28/03/18.
//  Copyright © 2018 Wayne Corporations Pvt Ltd. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import Firebase
import FirebaseCore

class FeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signInTapped(_ sender: Any) {
        let keychainResult = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        try! Auth.auth().signOut()
        performSegue(withIdentifier: "goToSignIn", sender: nil)
    }
    
}
