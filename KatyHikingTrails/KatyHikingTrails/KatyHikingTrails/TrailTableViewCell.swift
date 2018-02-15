//
//  TrailTableViewCell.swift
//  KatyHikingTrails
//
//  Created by Christopher Nady on 2/14/18.
//  Copyright © 2018 Nady Analytics, LLC. All rights reserved.
//

import UIKit

class TrailTableViewCell: UITableViewCell {

    @IBOutlet weak var TrailNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
