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
    @IBOutlet weak var defLbl: UILabel!
    @IBOutlet weak var nextEvolutionLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var attackLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.pokemon.downloadPokemonDetail {
            self.updateUI()
            self.pokemon.downloadDescription {
                self.updateUI()
            }
        }
    }
    
    func updateUI(){
        attackLabel.text = pokemon.attack
        defLbl.text = pokemon.defense
        nameLabel.text = pokemon.name.capitalized
        pokemonPictureImg.image = UIImage(named: "\(pokemon.pokedexId)")!
        currentEvoImg.image = UIImage(named: "\(pokemon.pokedexId)")!
        numberLbl.text = "\(pokemon.pokedexId)"
        typeLbl.text = pokemon.type
        descriptionLbl.text = pokemon.description
        
    }
    
    @IBAction func onBackClick(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
