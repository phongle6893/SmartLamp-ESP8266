//
//  Constant.swift
//  SmartLamp
//
//  Created by PhongLe on 11/24/17.
//  Copyright © 2017 PhongLe. All rights reserved.
//

import Foundation
import UIKit

enum LampType: String {
    case lamb = "lamb"
    case lamp = "lamp"
    case mainLamp = "mainLamp"
    case incandescent = "incandescent"
    
    func getImage() -> UIImage {
        return UIImage(named: self.rawValue)!
    }
}
