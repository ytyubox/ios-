//
//  TableViewController.swift
//  ios核心动画高级技巧
//
//  Created by 游宗諭 on 2020/6/5.
//  Copyright © 2020 游宗諭. All rights reserved.
//

import UIKit
class TableViewController:UITableViewController {
    
    let chapters:[UIViewController]  = [
        ViewController_ch1(),
        ViewController_ch2(),
    ]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chapters.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(type(of: chapters[indexPath.row]))"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(chapters[indexPath.row], animated: true)
    }
}
