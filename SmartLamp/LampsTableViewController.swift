//
//  LampsTableViewController.swift
//  SmartLamp
//
//  Created by PhongLe on 12/30/17.
//  Copyright © 2017 PhongLe. All rights reserved.
//

import UIKit
import FirebaseAuth
import PKHUD

class LampsTableViewController: UITableViewController, SettingDelegate {

    var dataSource: [(name: String, lid: String)] = []
    var uid = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        HUD.flash(.progress, delay: TimeInterval(Int.max))
        uid = (Auth.auth().currentUser?.uid)!
        MyDBRef.user(id: uid).referenceDatabase().child("lamps").observe(.value) { (data) in
            if data.exists() {
                var lamps: [(name: String, lid: String)] = []
                for (key, val) in (data.value as! [String: Any]) {
                    var lamp: (name: String, lid: String)
                    lamp.lid = key
                    let name = (val as! [String: Any])["name"] as! String
                    lamp.name = name
                    lamps.append(lamp)
                }
                self.dataSource = lamps
                
                self.tableView.reloadData()
            }
            HUD.flash(.progress)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lampCell", for: indexPath) as! LampTableViewCell
        cell.name.text = dataSource[indexPath.row].name
        cell.lid = dataSource[indexPath.row].lid
        cell.delegate = self
        cell.isOwner = false
        cell.switcher.isEnabled = false
        MyDBRef.lamp(id: dataSource[indexPath.row].lid).referenceDatabase().child("owner").observeSingleEvent(of: .value) { (isOwner) in
            if (isOwner.value as! String) == self.uid {
                cell.isOwner = true
            }
        }
        MyDBRef.lamp(id: dataSource[indexPath.row].lid).referenceDatabase().child("members/\(uid)").observeSingleEvent(of: .value) { (isMember) in
            if (isMember.value as! Bool){
                cell.switcher.isEnabled = true
            }
        }
        MyDBRef.lamp(id: dataSource[indexPath.row].lid).referenceDatabase().child("isOn").observe(.value) { (isOn) in
            if isOn.exists() {
                if isOn.value as! Int == 1 {
                    cell.switcher.isOn = true
                }else {
                    cell.switcher.isOn = false
                }
            }
        }
        
        return cell
    }
    func settingLamp(lid: String) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "member") as! MemberTableViewController
        vc.lid = lid
        navigationController?.pushViewController(vc, animated: true)
    }
}
