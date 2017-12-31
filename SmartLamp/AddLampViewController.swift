//
//  AddLampViewController.swift
//  SmartLamp
//
//  Created by PhongLe on 12/31/17.
//  Copyright © 2017 PhongLe. All rights reserved.
//

import UIKit
import FirebaseAuth
import PKHUD

class AddLampViewController: UITableViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var lid: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none

    }
    @IBAction func addAction(_ sender: Any) {
        MyDBRef.lamp(id: lid.text!).referenceDatabase().observeSingleEvent(of: .value) { (dataSnapshot) in
            if dataSnapshot.exists(){
                let data = dataSnapshot.value as! [String: Any]
                let owner = data["owner"] as! String
                let uid = Auth.auth().currentUser?.uid
                if owner == uid {
                    print("is owner")
                    HUD.flash(.labeledSuccess(title: "Success!", subtitle: "You are owner!"), delay: 3)
                }else if owner == "" {
                    
                    MyDBRef.lamp(id: self.lid.text!).referenceDatabase().child("members/\(uid!)").setValue(true)
                    MyDBRef.lamp(id: self.lid.text!).referenceDatabase().child("owner").setValue(uid!)
                    let data: [String: Any] = [
                        "name": self.name.text!,
                        "isActive": true
                    ]
                    MyDBRef.user(id: uid!).referenceDatabase().child("lamps/\(self.lid.text!)").setValue(data)
                    HUD.flash(.labeledSuccess(title: "Success!", subtitle: "You are owner!"), delay: 3)
                }else {
                    MyDBRef.lamp(id: self.lid.text!).referenceDatabase().child("members/\(uid!)").setValue(false)
                    let data: [String: Any] = [
                        "name": self.name.text!,
                        "isActive": false
                    ]
                    MyDBRef.user(id: uid!).referenceDatabase().child("lamps/\(self.lid.text!)").setValue(data)
                    HUD.flash(.labeledSuccess(title: "Success!", subtitle: "Wait for accepp from owner!"), delay: 3)
                }
            }else {
                print("lamp not found: 404")
            }
        }
    }
}
