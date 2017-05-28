//
//  Forecast.swift
//  rainyshinycloudy
//
//  Created by Javier Cabezas Leyton on 5/26/17.
//  Copyright © 2017 Javier Cabezas Leyton. All rights reserved.
//

import UIKit

class Forecast {
    var _date: String!
    var _weatherType: String!
    var _highTemp: String!
    var _lowTemp: String!
    
    var date: String{
        return _date == nil ? "" : _date
    }
    
    var weatherType: String{
        return _weatherType == nil ? "" : _weatherType
    }
    
    var highTemp: String{
        return _highTemp == nil ? "" : _highTemp
    }
    
    var lowTemp: String{
        return _lowTemp == nil ? "" : _lowTemp
    }
}
