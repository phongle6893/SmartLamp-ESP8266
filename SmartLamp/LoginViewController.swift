//
//  LoginViewController.swift
//  SmartLamp
//
//  Created by PhongLe on 12/30/17.
//  Copyright © 2017 PhongLe. All rights reserved.
//

import UIKit
import FirebaseAuth
import PKHUD

class LoginViewController: UITableViewController {

    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none

    }

    @IBAction func loginAction(_ sender: UIButton) {
        HUD.flash(.progress, delay: TimeInterval(Int.max) )

        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (firebaseUser, err) in
            if err != nil {
                print("---------------\n",err!)
            }else {
                HUD.flash(.progress)
                print("sign in: \((Auth.auth().currentUser?.uid)!)")
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "mainTabBar")
                self.present(vc!, animated: true, completion: nil)
            }
        }
    }
}
