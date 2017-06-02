//
//  Constants.swift
//  rainyshinycloudy
//
//  Created by Javier Cabezas Leyton on 5/21/17.
//  Copyright © 2017 Javier Cabezas Leyton. All rights reserved.
//

import Foundation

let BASE_URL = "http://samples.openweathermap.org/data/2.5/weather?"
let LAT = "lat=\(Location.sharedInstance.latitude!)"
let LONG = "lon=\(Location.sharedInstance.longitude!)"
let API_KEY = "appid=0e955a2338ef1ce44b5cd29cc0e44fbb"
typealias DownloadComplete = () -> ()

let CURRENT_URL = "\(BASE_URL)\(LAT)&\(LONG)&\(API_KEY)"
let CTN = "cnt=10"
let FORECAST_BASE = "http://samples.openweathermap.org/data/2.5/forecast/daily?"

let FORECAST_URL = "\(FORECAST_BASE)\(LAT)&\(LONG)&\(CTN)&\(API_KEY)"
