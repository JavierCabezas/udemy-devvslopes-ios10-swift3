//
//  ViewController.swift
//  pokedex
//
//  Created by Javier Cabezas Leyton on 6/3/17.
//  Copyright © 2017 Javier Cabezas Leyton. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {

    @IBOutlet weak var collection :UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var pokemon = [Pokemon]()
    var filteredPokemon = [Pokemon]()
    var inSearchMode = false
    
    var musicPlayer: AVAudioPlayer!
    var isAudioPlaying = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.dataSource = self
        collection.delegate = self
        searchBar.delegate = self
        
        self.parsePokemonCSV()
    }
    
    func parsePokemonCSV(){
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
        
        do {
            let csv = try CSV(contentsOfURL: path)
            
            for r in csv.rows {
                let pokemon_id = Int(r["id"]!)!
                let pokemon_name = r["identifier"]!
                
                let p = Pokemon(name: pokemon_name, pokedexId: pokemon_id)
                pokemon.append(p)
                
            }
            
        }catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell {
            let poke_temp = inSearchMode ? filteredPokemon : pokemon
            
            cell.configureCell(pokemon: poke_temp[indexPath.row])
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selected_poke = inSearchMode ? filteredPokemon[indexPath.row] : pokemon[indexPath.row]
        performSegue(withIdentifier: "PokemonDetailVC"  , sender: selected_poke)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PokemonDetailVC" {
            if let detailsVC = segue.destination as? PokemonDetailVC {
                if let poke = sender as? Pokemon{
                    detailsVC.pokemon = poke
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return inSearchMode ? filteredPokemon.count : pokemon.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        inSearchMode = searchBar.text != "nil" && searchBar.text != ""
        
        if inSearchMode {
            let lower = searchBar.text!.lowercased()
            filteredPokemon = pokemon.filter({$0.name.range(of: lower) != nil })
        }
        else{
            view.endEditing(true) //Hide the keyboard
        }
        collection.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true) //Hide the keyboard
    }
    
    @IBAction func musicBtnPressed(_ sender: Any) {
        if(isAudioPlaying){
            musicPlayer.stop()
            isAudioPlaying = false
        }else{
            let music_path = Bundle.main.path(forResource: "pokemon_center_theme", ofType: "mp3")!
            do {
                musicPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: music_path))
                musicPlayer.prepareToPlay()
                musicPlayer.numberOfLoops = -1
                musicPlayer.play()
                isAudioPlaying = true
                
            } catch let err as NSError {
                print(err.debugDescription)
                isAudioPlaying = false
            }
        }
    }
    
}

