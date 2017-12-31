//
//  CameraPreview.swift
//  SmartLamp
//
//  Created by PhongLe on 12/30/17.
//  Copyright © 2017 PhongLe. All rights reserved.
//

import UIKit
import AVFoundation

class CameraPreview: UIView {

    var videoPreviewLayer: AVCaptureVideoPreviewLayer{
        return layer as! AVCaptureVideoPreviewLayer
    }
    
    var session: AVCaptureSession? {
        get {
            return videoPreviewLayer.session
        }
        set {
            videoPreviewLayer.session = newValue
        }
            
    }
    
    

}
