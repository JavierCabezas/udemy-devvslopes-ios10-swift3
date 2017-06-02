//
//  Location.swift
//  rainyshinycloudy
//
//  Created by Javier Cabezas Leyton on 6/2/17.
//  Copyright © 2017 Javier Cabezas Leyton. All rights reserved.
//

import Foundation

class Location {
    static var sharedInstance = Location() //Static means that this class will be a singleton in the app, it will have just one state.

    private init() {}
    
    var latitude: Double!
    var longitude: Double!
    

}
