//
//  ViewController.swift
//  SampleCode
//
//  Created by klwx on 2017/6/2.
//  Copyright © 2017年 wufan. All rights reserved.
//

import UIKit

let ViewControllerCellID = "ViewControllerCellID"

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    let array = ["ScrollView In ScrollView"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "SampleCode"
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: ViewControllerCellID)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ViewControllerCellID, for: indexPath)
        cell.textLabel?.text = array[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(ScrollViewInScrollViewController(), animated: true)
    }

}

