//
//  DataService.swift
//  ngotest1
//
//  Created by Ankit Deshmukh on 29/03/18.
//  Copyright © 2018 Wayne Corporations Pvt Ltd. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = Database.database().reference()

class DataService {
    
    static let ds = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_NGO = DB_BASE.child("NGO")
    private var _REF_USERS = DB_BASE.child("users")
    
    var REF_BASE: DatabaseReference {
        return REF_BASE
    }
    
    var REF_NGO: DatabaseReference {
        return REF_NGO
    }
    
    func createFirebaseDBUser(uid: String, userData: Dictionary<String, String>){
        _REF_USERS.child(uid).updateChildValues(userData)
    }
}
