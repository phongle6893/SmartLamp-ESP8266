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
    var name: String
    var detail: String
    var type: LampType
    
    init(id: Int, name: String, detail: String, type: LampType) {
        self.id = id
        self.name = name
        self.detail = detail
        self.type = type
    }
}
