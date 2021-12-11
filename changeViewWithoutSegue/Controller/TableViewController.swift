//
//  TableViewController.swift
//  changeViewWithoutSegue
//
//  Created by 양호준 on 2021/12/11.
//

import UIKit

class TableViewController: UITableViewController {
    let profile = Profile()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Data Source
extension TableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profile.data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        
        content.text = profile.data[indexPath.row]
        
        cell.contentConfiguration = content
        
        return cell
    }
}
