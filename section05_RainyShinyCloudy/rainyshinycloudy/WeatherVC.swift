//
//  ViewController.swift
//  rainyshinycloudy
//
//  Created by Javier Cabezas Leyton on 5/18/17.
//  Copyright © 2017 Javier Cabezas Leyton. All rights reserved.
//

import UIKit

class WeatherWC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var currentWeather = CurrentWeather()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        currentWeather.downloadWeatherDetails {
            
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        
        return cell
    }
}

