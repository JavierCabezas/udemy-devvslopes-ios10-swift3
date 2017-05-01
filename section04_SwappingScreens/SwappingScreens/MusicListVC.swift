//
//  MusicListVC.swift
//  SwappingScreens
//
//  Created by Javier Cabezas Leyton on 5/1/17.
//  Copyright © 2017 Javier Cabezas Leyton. All rights reserved.
//

import UIKit

class MusicListVC: UIViewController {

    @IBOutlet weak var backBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func playSongBtnPressed(_ sender: Any) {
        let songTitle = "Coco Jambo"
        performSegue(withIdentifier: "PlaySongVC", sender: songTitle )

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PlaySongVC{
            if let song = sender as? String {
                destination.selectedSong = song
            }
        }
    }

}
