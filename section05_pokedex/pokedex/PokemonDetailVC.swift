//
//  PokemonDetailVC.swift
//  pokedex
//
//  Created by Javier Cabezas Leyton on 6/10/17.
//  Copyright © 2017 Javier Cabezas Leyton. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    var pokemon: Pokemon!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.nameLabel.text = pokemon.name.capitalized
    }
    
    @IBAction func onBackClick(_ sender: Any) {
        performSegue(withIdentifier: "PokemonListVC", sender: nil)
    }
    

}
