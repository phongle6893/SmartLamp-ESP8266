//
//  AppDelegate.swift
//  SmartLamp
//
//  Created by PhongLe on 11/24/17.
//  Copyright © 2017 PhongLe. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        if isLogin() {
            let masterView = mainStoryboard.instantiateViewController(withIdentifier: "mainTabBar")
            self.window?.rootViewController = masterView
        }else {
            
            let loginScreen = mainStoryboard.instantiateViewController(withIdentifier: "loginScreen")
            self.window?.rootViewController = loginScreen
        }
        
        //
        self.window?.makeKeyAndVisible()

        return true
    }
    
    func isLogin() -> Bool {
        if Auth.auth().currentUser?.uid != nil {
            return true
        }else {
            return false
        }
    }
}

