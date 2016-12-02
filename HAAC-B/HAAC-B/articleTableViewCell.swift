//
//  articleTableViewCell.swift
//  HAAC-B
//
//  Created by Ana Ma on 12/2/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class articleTableViewCell: UITableViewCell {

    @IBOutlet weak var articletitleLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
