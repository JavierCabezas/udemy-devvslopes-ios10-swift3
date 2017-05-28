//
//  CurrentWeather.swift
//  rainyshinycloudy
//
//  Created by Javier Cabezas Leyton on 5/21/17.
//  Copyright © 2017 Javier Cabezas Leyton. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    var _cityName: String!
    var _weatherType: String!
    var _currentTemp: Double!

    var cityName: String{
        return _cityName == nil ? "" : _cityName
    }
    
    var weatherType: String {
        return _weatherType == nil ? "" : _weatherType
    }
    
    var currentTemp: Double {
        return _currentTemp == nil ? 0.0 : _currentTemp
    }
    
    var date: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        return "Today, " + dateFormatter.string(from: Date())
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete){
        let currentWeatherURL = URL(string: CURRENT_URL)!
        Alamofire.request(currentWeatherURL).responseJSON { response in
            let result = response.result

            if let dict = result.value as? Dictionary <String, AnyObject>{
                if let name = dict["name"] as? String{
                    self._cityName = name
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    if let currentTemperature = main["temp"] as? Double {
                        self._currentTemp = (currentTemperature - 273.25).rounded()
                    }
                    
                }
            }
            completed()
        }
    }
}
