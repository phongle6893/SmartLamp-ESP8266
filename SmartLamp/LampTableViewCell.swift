//
//  LampTableViewCell.swift
//  SmartLamp
//
//  Created by PhongLe on 11/24/17.
//  Copyright © 2017 PhongLe. All rights reserved.
//

import UIKit

class LampTableViewCell: UITableViewCell {
    var delegate: SettingDelegate?
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var switcher: UISwitch!
    var lid = ""
    @IBOutlet weak var settingButton: UIButton!
    var isOwner: Bool? {
        didSet {
            if !isOwner! {
                settingButton.alpha = 0
                settingButton.isEnabled = false
            }else {
                settingButton.alpha = 1
                settingButton.isEnabled = true
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        socket.connect()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
    @IBAction func settingAction(_ sender: Any) {
        delegate?.settingLamp(lid: lid)
    }
    @IBAction func switcherAction(_ sender: UISwitch) {
        switch sender.isOn {
        case true:
            MyDBRef.lamp(id: lid).referenceDatabase().child("isOn").setValue(1)
        default:
            MyDBRef.lamp(id: lid).referenceDatabase().child("isOn").setValue(0)
        }
    }
}
protocol SettingDelegate {
    func settingLamp(lid: String)
}
