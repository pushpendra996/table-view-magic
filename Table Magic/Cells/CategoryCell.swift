//
//  CategoryCell.swift
//  Table Magic
//
//  Created by Pushpendra Saini on 03/05/22.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var imgIcon: UIImageView! {
        didSet {
            self.imgIcon.layer.cornerRadius = 5
        }
    }
    @IBOutlet weak var lbTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
