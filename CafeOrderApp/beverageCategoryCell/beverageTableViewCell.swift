//
//  TableViewCell.swift
//  CafeOrderApp
//
//  Created by 이상헌 on 2021/07/25.
//

import UIKit

class beverageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var beverageImage: UIImageView!
    @IBOutlet weak var beverageCategoryTitle: UILabel!
    @IBOutlet weak var beverageCategorySubTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
