//
//  ViewController.swift
//  rainyshinycloudy
//
//  Created by Javier Cabezas Leyton on 5/18/17.
//  Copyright © 2017 Javier Cabezas Leyton. All rights reserved.
//

import UIKit

class WeatherWC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var currentDateLabel: UILabel!
    @IBOutlet weak var currentCityLabel: UILabel!
    
    var currentWeather = CurrentWeather()
    var forecastList = ForecastList()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        currentWeather.downloadWeatherDetails {
            self.updateMainUI()
        }
    
        forecastList.downloadForecastData {
            self.tableView.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.forecastList.forecasts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell {
            let forecast_cell = self.forecastList.forecasts[indexPath.row]
            cell.configureCell(f: forecast_cell)
            return cell
        } else {
            return WeatherCell()
        }
    }
    
    func updateMainUI() {
        currentDateLabel.text = currentWeather.date
        currentTempLabel.text = "\(currentWeather.currentTemp)"
        currentWeatherLabel.text = currentWeather.weatherType
        currentCityLabel.text = currentWeather.cityName
        currentWeatherImage.image = UIImage(named: currentWeather.weatherType)
    }
}

