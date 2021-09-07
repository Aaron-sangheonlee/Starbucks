//
//  beverageCell.swift
//  CafeOrderApp
//
//  Created by 이상헌 on 2021/07/26.
//

import UIKit

class beverageCell: UITableViewCell {
    
    @IBOutlet weak var beverageImage: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var beverageTitle: UILabel!
    @IBOutlet weak var beverageSubTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
