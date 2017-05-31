//
//  WeatherCell.swift
//  rainyshinycloudy
//
//  Created by Javier Cabezas Leyton on 5/30/17.
//  Copyright © 2017 Javier Cabezas Leyton. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var lowTemp: UILabel!

    
    func configureCell(f: Forecast){
        lowTemp.text = "\(f.lowTemp)"
        highTemp.text = "\(f.highTemp)"
        weatherType.text = f.date
        weatherIcon.image = UIImage(named: f.weatherType)
        dayLabel.text = f.date
    }
}
