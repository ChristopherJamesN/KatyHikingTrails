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
    @IBOutlet weak var AllTrailsDescriptionLabel: UILabel!
    @IBOutlet weak var AllTrailsMapLinkLabel: UILabel!
    @IBOutlet weak var AddicksTrailNameLabel: UILabel!
    @IBOutlet weak var AddicksTrailsDescriptionLabel: UILabel!
    @IBOutlet weak var AddicksTrailsMapLinkLabel: UILabel!
    @IBOutlet weak var BarkerTrailNameLabel: UILabel!
    @IBOutlet weak var BarkerTrailsDescriptionLabel: UILabel!
    @IBOutlet weak var BarkerTrailsMapLinkLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
