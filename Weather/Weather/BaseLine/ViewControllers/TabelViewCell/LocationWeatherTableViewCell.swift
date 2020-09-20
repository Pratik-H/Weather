//
//  LocationWeatherTableViewCell.swift
//  Weather
//
//  Created by Neosoft on 20/09/20.
//  Copyright © 2020 Pratik. All rights reserved.
//

import UIKit

class LocationWeatherTableViewCell: UITableViewCell {

    // MARK: - Parameters
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var valueLabel: UILabel!
    
    // MARK: - Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
}
