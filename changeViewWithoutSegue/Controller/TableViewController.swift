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

// MARK: - Delegate
extension TableViewController {
    // , "취미", "야곰 아카데미", "경력"
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedProfile = self.profile.data[indexPath.row]
        
        if selectedProfile == "출신 학교" {
            let schoolStoryboard = UIStoryboard(name: "School", bundle: nil)
            let schoolViewController = schoolStoryboard.instantiateViewController(withIdentifier: "School")
            
            self.navigationController?.pushViewController(schoolViewController, animated: true)
        } else if selectedProfile == "자기소개" {
            let schoolStoryboard = UIStoryboard(name: "Introduce", bundle: nil)
            let schoolViewController = schoolStoryboard.instantiateViewController(withIdentifier: "Introduce")
            
            self.navigationController?.pushViewController(schoolViewController, animated: true)
        } else if selectedProfile == "링크" {
            let schoolStoryboard = UIStoryboard(name: "Link", bundle: nil)
            let schoolViewController = schoolStoryboard.instantiateViewController(withIdentifier: "Link")
            
            self.navigationController?.pushViewController(schoolViewController, animated: true)
        }
    }
}
