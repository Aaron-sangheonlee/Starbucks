//
//  TableViewCell.swift
//  CafeOrderApp
//
//  Created by 이상헌 on 2021/07/27.
//

import UIKit

class myMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var beverageTitle: UILabel!
    @IBOutlet weak var beverageEngTitle: UILabel!
    @IBOutlet weak var beveragePrice: UILabel!
    @IBOutlet weak var myMenuButton: UIButton!
    @IBOutlet weak var orderButton: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
