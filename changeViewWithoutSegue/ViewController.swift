//
//  ViewController.swift
//  changeViewWithoutSegue
//
//  Created by 양호준 on 2021/12/11.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var descriptionButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionButton?.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = view.safeAreaLayoutGuide
        
        let safeBottomAnchor = descriptionButton?.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        safeBottomAnchor?.isActive = true
        safeBottomAnchor?.priority = .defaultHigh
        
        descriptionButton?.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -30).isActive = true
    }


}

