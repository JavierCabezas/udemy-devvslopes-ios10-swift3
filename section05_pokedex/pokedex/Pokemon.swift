//
//  Pokemon.swift
//  pokedex
//
//  Created by Javier Cabezas Leyton on 6/3/17.
//  Copyright © 2017 Javier Cabezas Leyton. All rights reserved.
//

import Foundation

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
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    var description:String {
        return _description
    }
    
    var type:String {
        return _type
    }
    
    var defense:String {
        return _defense
    }
    
    var height:String {
        return _height
    }
    
    var attack:String {
        return _attack
    }
    
    var weigth:String {
        return _weigth
    }
    var nextEvolutionTxt:String {
        return _nextEvolutionTxt
    }
    
    var nextEvolutionId:Int {
        return _nextEvolutionId
    }
    
    init(name: String, pokedexId: Int){
        self._name = name
        self._pokedexId = pokedexId
    }
}
