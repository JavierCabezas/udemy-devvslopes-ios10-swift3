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
    @IBOutlet weak var pokemonPictureImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.nameLabel.text = pokemon.name.capitalized
        self.pokemonPictureImg.image = UIImage(named: "\(pokemon.pokedexId)")!
    
    }
    
    @IBAction func onBackClick(_ sender: Any) {
        performSegue(withIdentifier: "PokemonListVC", sender: nil)
    }
    

}
