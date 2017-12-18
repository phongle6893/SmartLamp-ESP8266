//
//  ViewController.swift
//  SmartLamp
//
//  Created by PhongLe on 11/26/17.
//  Copyright © 2017 PhongLe. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController{
    
    
    @IBOutlet weak var switcher: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func swicherAction(_ sender: UISwitch) {
        print("switch change")
        if switcher.isOn{
        print("switch on")
            Database.database().reference().child("Pods-SI-234/LEDStatus").setValue(1)
        }else {
            Database.database().reference().child("Pods-SI-234/LEDStatus").setValue(0)
        }
    }
}
