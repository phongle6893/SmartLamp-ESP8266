//
//  wifiConfigController.swift
//  SmartLamp
//
//  Created by PhongLe on 12/17/17.
//  Copyright © 2017 PhongLe. All rights reserved.
//

import UIKit
import Alamofire

class wifiConfigController: UITableViewController {
    // 1
    let defaultSession = URLSession(configuration: .default)
    // 2
    var dataTask: URLSessionDataTask?

    @IBOutlet weak var ssid: UITextField!
    @IBOutlet weak var pass: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    @IBAction func connectAction(_ sender: UIButton) {
        changeWifi(ssid: ssid.text!, pass: pass.text!) { (result) in
            print(result)
        }
    }
    
    func changeWifi(ssid: String, pass: String, completion: @escaping (String)->Void) {
        print("wifi changing")
        let url = URL(string: "http://192.168.4.1/change?ssid=\(ssid)&pass=\(pass)")
        URLSession.shared.dataTask(with: url!) { (data, res, err) in
            print("data task callback")
//            if err == nil {
//
//            }else {
//                print(res!)
//                print(data!)
//            }
        }.resume()
    }
    
}
