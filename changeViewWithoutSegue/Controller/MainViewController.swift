//
//  ViewController.swift
//  changeViewWithoutSegue
//
//  Created by 양호준 on 2021/12/11.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet private weak var descriptionButton: UIButton?
    @IBOutlet private weak var nameLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConstraint()
    }

    private func setupConstraint() {
        descriptionButton?.translatesAutoresizingMaskIntoConstraints = false
        nameLabel?.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = view.safeAreaLayoutGuide
        
        let safeBottomAnchor = descriptionButton?.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        safeBottomAnchor?.isActive = true
        safeBottomAnchor?.priority = .defaultHigh
        
        descriptionButton?.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -60).isActive = true
        
        nameLabel?.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        nameLabel?.font = .preferredFont(forTextStyle: .largeTitle)
    }
    
    @IBAction private func touchUpDescriptionButton(_ sender: Any) {
        let tableStoryboad = UIStoryboard(name: "SecondStoryboard", bundle: nil)
        let tableViewController = tableStoryboad.instantiateViewController(withIdentifier: "Table")
        
        self.navigationController?.pushViewController(tableViewController, animated: true)
    }
}

