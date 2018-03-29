//
//  Post.swift
//  ngotest1
//
//  Created by Ankit Deshmukh on 29/03/18.
//  Copyright © 2018 Wayne Corporations Pvt Ltd. All rights reserved.
//

import Foundation

class Post {
    private var _Location: String!
    private var _imageUrl: String!
    private var _overview: String!
    private var _postKey: String!
    
    var Location: String {
        return _Location
    }
    
    var imageUrl: String {
        return _imageUrl
    }
    
    var overview: String {
        return _overview
    }
    
    var postKey: String {
        return _postKey
    }

    init(Location: String, imageUrl: String, overview: String) {
        self._Location = Location
        self._imageUrl = imageUrl
        self._overview = overview
    }
    
    init(postKey: String, postData: Dictionary<String, AnyObject>) {
        self._postKey = postKey
        
        if let Location = postData["location"] as? String {
        self._Location = Location
        }
        
        if let imageUrl = postData["imageUrl"] as? String {
            self._imageUrl = imageUrl
        }
        
        if let overview = postData["overview"] as? String {
            self._overview = overview
        }
    }
    
    
}

