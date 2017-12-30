//
//  LampTableViewCell.swift
//  SmartLamp
//
//  Created by PhongLe on 11/24/17.
//  Copyright © 2017 PhongLe. All rights reserved.
//

import UIKit

class LampTableViewCell: UITableViewCell {
    var id: Int = 0
    @IBOutlet weak var switcher: UISwitch!{
        didSet{
            switcher.setOn(false, animated: true)
        }
    }
    @IBOutlet weak var detail: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var lampImage: UIImageView!
    
//    var socket = SocketIOClient(socketURL: URL(string: "http://127.0.0.1:8000")!, config: [.log(true), .compress]) {
//        didSet{
//
//        }
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        socket.connect()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func switchAction(_ sender: Any) {
        
        
//        if switcher.isOn {
//            socket.emit("turnOn", with: [id])
//        }else {
//            socket.emit("turnOff", with: [id])
//        }
    }
}
