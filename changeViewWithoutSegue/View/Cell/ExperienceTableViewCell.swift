//
//  TableViewCell.swift
//  changeViewWithoutSegue
//
//  Created by 양호준 on 2021/12/26.
//

import UIKit

class ExperienceTableViewCell: UITableViewCell {
    @IBOutlet weak var experienceNameLabel: UILabel!
    @IBOutlet weak var experienceDurationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureCell(with data: Experience) {
        experienceNameLabel.text = data.name
        experienceDurationLabel.text = data.duration
    }
}
