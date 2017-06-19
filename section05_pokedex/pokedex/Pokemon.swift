//
//  Pokemon.swift
//  pokedex
//
//  Created by Javier Cabezas Leyton on 6/3/17.
//  Copyright © 2017 Javier Cabezas Leyton. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    private var _name:String!
    private var _pokedexId:Int!
    private var _description:String!
    private var _type:String!
    private var _defense:String!
    private var _height:String!
    private var _attack:String!
    private var _weigth:String!
    private var _nextEvolutionTxt:String!
    private var _nextEvolutionId:Int!
    private var _pokemonURL: String!
    private var _descURL: String!
    
    var name: String {
        return _name == nil ? "" : _name
    }
    
    var pokedexId: Int {
        return _pokedexId == nil ? 0 : _pokedexId
    }
    
    var description:String {
        return _description == nil ? "" : _description
    }
    
    var type:String {
        return _type == nil ? "" : _type
    }
    
    var defense:String {
        return _defense == nil ? "" : _defense
    }
    
    var height:String {
        return _height == nil ? "" : _height
    }
    
    var attack:String {
        return _attack == nil ? "" : _attack
    }
    
    var weigth:String {
        return _weigth == nil ? "" : _weigth
    }
    var nextEvolutionTxt:String {
        return _nextEvolutionTxt == nil ? "" : _nextEvolutionTxt
    }
    
    var nextEvolutionId:Int {
        return _nextEvolutionId == nil ? 0 : _nextEvolutionId
    }
    
    init(name: String, pokedexId: Int){
        self._name = name
        self._pokedexId = pokedexId
        self._pokemonURL = URL_BASE + URL_POKEMON + "\(self.pokedexId)"
    }
    

    func downloadDescription(completed: @escaping DownloadComplete) {
        Alamofire.request(self._descURL).responseJSON { response in
            if let descDict = response.result.value as? Dictionary <String, AnyObject> {
                if let d = descDict["description"] as? String {
                    self._description = d
                }
            }
            completed()
        }
    }
    
    func downloadPokemonDetail(completed: @escaping DownloadComplete){
        Alamofire.request(self._pokemonURL).responseJSON { response in
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject>  {//<Key, Values>
                if let weight = dict["weigth"] as? String {
                    self._weigth = weight
                }
                
                if let height = dict["height"] as? String {
                    self._height = height
                }
                
                if let attack = dict["attack"] as? Int {
                    self._attack = "\(attack)"
                }
                
                if let def = dict["defense"] as? Int {
                    self._defense = "\(def)"
                }
                
                if let types = dict["types"] as? [Dictionary<String, String>] {
                    if types.count == 1 {
                        if let type_1 = types[0]["name"] {
                            self._type = type_1.capitalized
                        }
                    }

                    if types.count == 2{
                        if let type_2 = types[1]["name"], let type_1 = types[0]["name"] {
                            self._type = type_1.capitalized + "/" + type_2.capitalized
                        }
                    }
                }
                
                if let descArr = dict["descriptions"] as? [Dictionary<String, String>], descArr.count > 0 {
                    if let url = descArr[0]["resource_uri"] {
                        self._descURL = URL_BASE + url
                    }
                }
            }
            completed()
        }
    }
}
