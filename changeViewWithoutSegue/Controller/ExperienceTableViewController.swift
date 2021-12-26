//
//  ExperienceTableViewController.swift
//  changeViewWithoutSegue
//
//  Created by 양호준 on 2021/12/25.
//

import UIKit

class ExperienceTableViewController: UITableViewController {
    let jsonParser = JsonParser()
    var experienceLists: [Experience] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        fetchData()
    }

    // MARK: - Data Source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        experienceLists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "experienceCell", for: indexPath)
        
        let experience = experienceLists[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        
        content.text = experience.name
        content.secondaryText = experience.duration
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    // MARK: - Methods
    private func updateUI() {
        self.title = "경험 정리 리스트"
    }
    
    private func fetchData() {
        do {
            experienceLists = try jsonParser.decode()
        } catch {
            print(error)
        }
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let experience = self.experienceLists[indexPath.row]
        
        let experienceDetailStoryBoard = UIStoryboard(name: "ExperienceDetail", bundle: nil)
        
        let experienceDetailViewController = experienceDetailStoryBoard.instantiateViewController(identifier: "ExperienceDetail") { coder in
            ExperienceDetailTableViewController(coder: coder, experience: experience)
        }
        
        navigationController?.pushViewController(experienceDetailViewController, animated: true)
    }
}
