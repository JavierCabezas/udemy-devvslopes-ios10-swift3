//
//  Constants.swift
//  rainyshinycloudy
//
//  Created by Javier Cabezas Leyton on 5/21/17.
//  Copyright © 2017 Javier Cabezas Leyton. All rights reserved.
//

import Foundation

let BASE_URL = "http://samples.openweathermap.org/data/2.5/weather"
let LAT = "lat="
let LONG = "lon="
let APP_ID = "appid="
let API_KEY = "0e955a2338ef1ce44b5cd29cc0e44fbb"
typealias DownloadComplete = () -> ()

let CURRENT_URL = "\(BASE_URL)?\(LAT)-33.456940&\(LONG)-70.648270&\(APP_ID)\(API_KEY)"


let FORECAST_BASE = "http://samples.openweathermap.org/data/2.5/forecast/daily"
let ID = "id="
let CITY_ID = "3871336"
let FORECAST_URL = "\(FORECAST_BASE)?\(ID)\(CITY_ID)&\(APP_ID)=\(API_KEY)"
