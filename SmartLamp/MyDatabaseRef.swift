//
//  MyDatabaseRef.swift
//  SmartLamp
//
//  Created by PhongLe on 12/30/17.
//  Copyright © 2017 PhongLe. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

enum Path: String {
    case USER = "Users"
    case LAMP = "Lamps"
}

enum MyDBRef {
    // User
    case userRoot
    case user(id: String)
    
    // Lamps
    case lampRoot
    case lamp(id: String)
    
    // Get ref
    public func referenceDatabase() -> DatabaseReference {
        return rootRefDB.child(refPath)
    }
    
    public var rootRefDB: DatabaseReference {
        return Database.database().reference()
    }
    
    // Get path
    private var refPath: String{
        switch self {
        // Users
        case .userRoot:
            return Path.USER.rawValue
        case .user(let id):
            return "\(Path.USER.rawValue)/\(id)"
            
        // Lamps
        case .lampRoot:
            return Path.LAMP.rawValue
        case .lamp(let id):
            return "\(Path.LAMP.rawValue)/\(id)"
        }
    }
}
