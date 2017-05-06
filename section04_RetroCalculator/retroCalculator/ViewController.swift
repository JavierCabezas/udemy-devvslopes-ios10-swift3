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
    
    @IBOutlet weak var outputLbl: UILabel!

    var btnSound: AVAudioPlayer!
    var runningNumber = ""
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
    }
    var currentOperation = Operation.Empty
    var leftValStr = ""
    var rightValStr = ""
    var result = ""
    
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
        runningNumber += "\(sender.tag)"
        outputLbl.text = runningNumber
    }
    
    @IBAction func operatorPressed(sender: UIButton){
        switch sender.tag{
            case 10:
                processOperation(operation: .Add)
            case 11:
                processOperation(operation: .Subtract)
            case 12:
                processOperation(operation: .Divide)
            case 13:
                processOperation(operation: .Multiply)
            default:
                currentOperation = Operation.Empty
                processOperation(operation: currentOperation)
        }
    }
    
    func playSound(){
        if btnSound.isPlaying{
            btnSound.stop()
        }
        btnSound.play()
    }
    
    func processOperation(operation: Operation){
        playSound()
        
        if currentOperation != Operation.Empty {
            if runningNumber != ""{
                rightValStr = runningNumber
            }
            runningNumber = ""
            
            switch currentOperation {
                case Operation.Multiply:
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                case Operation.Add:
                    result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                case Operation.Divide:
                    result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                case Operation.Subtract:
                    result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                default:
                    print ("!")
            }
            
            leftValStr = result
            outputLbl.text = result
        } else{
            leftValStr = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
}

