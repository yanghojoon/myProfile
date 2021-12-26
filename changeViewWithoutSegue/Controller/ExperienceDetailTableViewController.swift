//
//  ExperienceDetailTableViewController.swift
//  changeViewWithoutSegue
//
//  Created by 양호준 on 2021/12/26.
//

import UIKit

class ExperienceDetailTableViewController: UIViewController {
    var experience: Experience?
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        setupUI()
    }
    
    // MARK: - Initializer
    init?(coder: NSCoder, experience: Experience) {
        self.experience = experience
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Methods
    func updateUI() {
        guard let experience = experience else {
            return
        }
        
        self.descriptionLabel.text = experience.description
        self.title = experience.name
    }
    
    func setupUI() {
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakStrategy = .hangulWordPriority
    }
}
