//
//  RemoteLampController.swift
//  SmartLamp
//
//  Created by PhongLe on 11/24/17.
//  Copyright © 2017 PhongLe. All rights reserved.
//

import UIKit
import SocketIO
class RemoteLampController: UITableViewController{
    
//    let socket = SocketIOClient(socketURL: URL(string: "http://127.0.0.1:8000")!, config: [.log(true), .compress])
    
    var dataSource = [
        LampModel(id: 3, name: "table lamp", detail: "detail", type: .lamp),
        LampModel(id: 4, name: "ceiling lamp", detail: "detail", type: .mainLamp),
        LampModel(id: 5, name: "Christmas tree", detail: "detail", type: .lamb),
        LampModel(id: 6, name: "table lamp", detail: "detail", type: .lamp)
//        LampModel(id: 7, name: "ceiling lamp", detail: "detail", type: .mainLamp)
//        LampModel(id: "001", name: "Christmas tree", detail: "detail", type: .lamb),
//        LampModel(id: "001", name: "table lamp", detail: "detail", type: .lamp),
//        LampModel(id: "002", name: "ceiling lamp", detail: "detail", type: .mainLamp),
//        LampModel(id: "001", name: "Christmas tree", detail: "detail", type: .lamb),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Remote lamps"
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lampCell", for: indexPath) as! LampTableViewCell
        let image = dataSource[indexPath.row].type.getImage()
        cell.lampImage.image = image
        cell.name.text = dataSource[indexPath.row].name
        cell.detail.text = dataSource[indexPath.row].detail
        cell.id = dataSource[indexPath.row].id
        
        //Color
        let colors = image.getColors()
        
        cell.backgroundColor = colors.background
//        cell.name.backgroundColor = colors.primary
        cell.name.textColor = colors.secondary
        cell.detail.textColor = colors.detail
        cell.switcher.onTintColor = colors.secondary
        
        
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height/10
    }

}
