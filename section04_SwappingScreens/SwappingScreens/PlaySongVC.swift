//
//  PlaySongVC.swift
//  SwappingScreens
//
//  Created by Javier Cabezas Leyton on 5/1/17.
//  Copyright © 2017 Javier Cabezas Leyton. All rights reserved.
//

import UIKit

class PlaySongVC: UIViewController {
    
    private var _selectedSong:String!
    @IBOutlet weak var labelSong: UILabel!
    
    var selectedSong:String {
        get {
            return _selectedSong
        }
        set {
            _selectedSong = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelSong.text = _selectedSong
    }
}
