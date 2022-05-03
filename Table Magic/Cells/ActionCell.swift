//
//  ActionCell.swift
//  Table Magic
//
//  Created by Pushpendra Saini on 03/05/22.
//

import UIKit

class ActionCell: UITableViewCell {
    @IBOutlet weak var btnSubmit: UIButton! {
        didSet {
            self.btnSubmit.layer.cornerRadius = 10
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
