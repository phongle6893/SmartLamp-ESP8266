//
//  MemberTableViewCell.swift
//  SmartLamp
//
//  Created by PhongLe on 12/31/17.
//  Copyright © 2017 PhongLe. All rights reserved.
//

import UIKit

class MemberTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var switcher: UISwitch!
    var uid = ""
    var lid = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func switcherAction(_ sender: UISwitch) {
        switch sender.isOn {
        case true:
            MyDBRef.lamp(id: lid).referenceDatabase().child("members/\(uid)").setValue(true)
            
            MyDBRef.user(id: uid).referenceDatabase().child("lamps/\(lid)/isActive").setValue(true)
        default:
            MyDBRef.lamp(id: lid).referenceDatabase().child("members/\(uid)").setValue(false)
            
            MyDBRef.user(id: uid).referenceDatabase().child("lamps/\(lid)/isActive").setValue(false)
        }
        
    }
}
