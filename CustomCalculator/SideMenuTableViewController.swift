//
//  SideMenuTableViewController.swift
//  CustomCalculator
//
//  Created by 中川 慶悟 on 2017/02/26.
//  Copyright © 2017年 Keigo Nakagawa. All rights reserved.
//

import UIKit

class SideMenuTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        if indexPath.row == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "background", for: indexPath)
        } else if indexPath.row == 1 {
            cell = tableView.dequeueReusableCell(withIdentifier: "other", for: indexPath)
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
}
