//
//  DescriptionViewController.swift
//  changeViewWithoutSegue
//
//  Created by 양호준 on 2021/12/11.
//

import UIKit

class SchoolViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        nameLabel?.font = .preferredFont(forTextStyle: .largeTitle)
    }
}
