//
//  ViewController.swift
//  retroCalculator
//
//  Created by Javier Cabezas Leyton on 5/3/17.
//  Copyright © 2017 Javier Cabezas Leyton. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var btnSound: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "btn", ofType: "wav")
        let SoundURL = URL(fileURLWithPath: path!)
        
        do {
            try btnSound = AVAudioPlayer(contentsOf: SoundURL)
            btnSound.prepareToPlay()
        } catch let err as NSError{
            print(err.debugDescription)
        }
    }
    
    @IBAction func numberPressed(sender: UIButton){
        playSound()
    }
    
    func playSound(){
        if btnSound.isPlaying{
            btnSound.stop()
        }
        btnSound.play()
    }
}

