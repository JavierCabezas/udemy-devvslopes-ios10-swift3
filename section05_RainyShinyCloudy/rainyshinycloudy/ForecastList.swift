//
//  ForecastList.swift
//  rainyshinycloudy
//
//  Created by Javier Cabezas Leyton on 5/27/17.
//  Copyright © 2017 Javier Cabezas Leyton. All rights reserved.
//

import Foundation
import Alamofire

class ForecastList {
    var _forecasts = [Forecast]()
    
    var forecasts: [Forecast] {
        return _forecasts.isEmpty ? [] : _forecasts
    }

    func downloadForecastData(completed: @escaping DownloadComplete) {
        let forecastDataURL = URL(string: FORECAST_URL)!
        Alamofire.request(forecastDataURL).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary <String, AnyObject>{
                if let weather = dict["list"] as? [Dictionary<String, AnyObject>] {
                    for f in weather {
                        let temp_forecast = Forecast()

                        if let forecast_item = f["temp"] {
                            
                            if let minTemp = forecast_item["min"] as? Double {
                                temp_forecast._lowTemp = "\((minTemp - 273.25).rounded())"
                            }
                            
                            if let maxTemp = forecast_item["max"] as? Double {
                                temp_forecast._highTemp = "\((maxTemp - 273.25).rounded())"
                            }
                        }
                        
                        if let forecast_item = f["weather"] as? [Dictionary<String, AnyObject>] {
                            if let weather_type = forecast_item[0]["main"] as? String {
                                temp_forecast._weatherType = weather_type
                            }
                        }
                        
                        if let timestamp = f["dt"] as? Double {
                            let unixDate = Date(timeIntervalSince1970: timestamp)
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateStyle = .full
                            dateFormatter.dateFormat = "EEEE"
                            dateFormatter.timeStyle = .none
                            temp_forecast._date = unixDate.dayOfTheWeek()
                        }
                        
                        self._forecasts.append(temp_forecast)
                    }
                }
            }
            completed()
        }
    }
}

extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
