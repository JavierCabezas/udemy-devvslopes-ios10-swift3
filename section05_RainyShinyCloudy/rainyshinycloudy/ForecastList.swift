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
                        if let forecast_item = f["temp"] as? AnyObject {
                            let temp_forecast = Forecast()
                            
                            if let minTemp = forecast_item["min"] as? Double {
                                temp_forecast._lowTemp = "\((minTemp - 273.25).rounded())"
                            }
                            
                            if let maxTemp = forecast_item["max"] as? Double {
                                temp_forecast._highTemp = "\((maxTemp - 273.25).rounded())"
                            }
                            
                            self._forecasts.append(temp_forecast)
                        }
                    }
                }
            }
            completed()
        }
    }
}
