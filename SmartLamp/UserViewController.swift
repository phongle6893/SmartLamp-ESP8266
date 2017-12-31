//
//  UserViewController.swift
//  SmartLamp
//
//  Created by PhongLe on 12/31/17.
//  Copyright © 2017 PhongLe. All rights reserved.
//

import UIKit
import PKHUD
import FirebaseAuth

class UserViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        MyDBRef.user(id: (Auth.auth().currentUser?.uid)!).referenceDatabase().observeSingleEvent(of: .value) { (data) in
            if data.exists(){
                let user = data.value as! [String: Any]
                self.name.text = user["name"] as! String
                self.email.text = user["email"] as! String
                HUD.flash(.progress)
            }
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        do{
            try Auth.auth().signOut()
            print("signout")
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "loginScreen")
            self.present(vc!, animated: true, completion: nil)
        }catch {
            print("signout failed!")
        }
    }
}
