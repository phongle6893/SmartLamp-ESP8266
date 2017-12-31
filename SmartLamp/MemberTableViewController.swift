//
//  MemberTableViewController.swift
//  SmartLamp
//
//  Created by PhongLe on 12/31/17.
//  Copyright © 2017 PhongLe. All rights reserved.
//

import UIKit
import PKHUD

class MemberTableViewController: UITableViewController {
    var lid: String?
    var dataSource: [(mid: String, active: Bool)] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none

        HUD.flash(.progress, delay: TimeInterval(Int.max))

        MyDBRef.lamp(id: lid!).referenceDatabase().child("members").observe(.value) { (data) in
            if data.exists() {
                var members: [(mid: String, active: Bool)] = []
                for (key, value) in (data.value as! [String: Any]) {
                    let member: (mid: String, active: Bool)
                    member.mid = key
                    member.active = value as! Bool
                    members.append(member)
                }
                self.dataSource = members
                self.tableView.reloadData()
                HUD.flash(.progress)

            }
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
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Members: "
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "memberCell", for: indexPath) as! MemberTableViewCell
        cell.uid = dataSource[indexPath.row].mid
        cell.lid = lid!
        cell.name.text = dataSource[indexPath.row].mid
        
        MyDBRef.user(id: dataSource[indexPath.row].mid).referenceDatabase().child("name").observeSingleEvent(of: .value) { (name) in
            cell.name.text = name.value as! String
        }
        cell.switcher.isOn = dataSource[indexPath.row].active
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if var vc = segue.destination as? wifiConfigController {
            vc.lid = lid!
        }
    }

}
