//
//  IntroduceViewController.swift
//  changeViewWithoutSegue
//
//  Created by 양호준 on 2021/12/11.
//

import UIKit

class IntroduceViewController: UIViewController {
    let introduceData = Introduce()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        setupUI()
        
    }
    
    func fetchData() {
        titleLabel.text = introduceData.title
        bodyLabel.text = introduceData.body
    }
    
    func setupUI() {
        titleLabel.font = .preferredFont(forTextStyle: .largeTitle)
        bodyLabel.numberOfLines = 0
    }
}
