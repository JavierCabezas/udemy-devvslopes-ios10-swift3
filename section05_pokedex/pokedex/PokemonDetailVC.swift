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
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var numberLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var atkLbl: UIStackView!
    @IBOutlet weak var defLbl: UILabel!
    @IBOutlet weak var nextEvolutionLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.nameLabel.text = pokemon.name.capitalized
        self.pokemonPictureImg.image = UIImage(named: "\(pokemon.pokedexId)")!
    
    }
    
    @IBAction func onBackClick(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
