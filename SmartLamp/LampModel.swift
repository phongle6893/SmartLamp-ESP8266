//
//  LampModel.swift
//  SmartLamp
//
//  Created by PhongLe on 11/24/17.
//  Copyright © 2017 PhongLe. All rights reserved.
//

import Foundation
import UIKit

class LampModel {
    var id: Int
    var owner: String?
    var name: String?
    var isOn: Bool?
    
    init(id: Int, name: String?, owner: String?, isOn: Bool?){
        self.id = id
        self.name = name
        self.owner = owner
        self.isOn = isOn
    }
}
