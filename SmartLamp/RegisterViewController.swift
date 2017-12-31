//
//  RegisterViewController.swift
//  SmartLamp
//
//  Created by PhongLe on 12/30/17.
//  Copyright © 2017 PhongLe. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class RegisterViewController: UITableViewController {

    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPasswod: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none

    }

    @IBAction func registerAction(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: email.text!, password: confirmPasswod.text!) { (firebaseUser, err) in
            if err != nil {
                print("---------------------\n",err!)
            }else {
                let uid = firebaseUser?.uid
                
                let userInfo: [String: String] = [
                    "name": self.name.text!,
                    "email": self.email.text!
                ]
                MyDBRef.user(id: uid!).referenceDatabase().setValue(userInfo)
            }
        }
    }
}
