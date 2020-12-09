//
//  Pokemon.swift
//  NetowrkCalls
//
//  Created by Field Employee on 12/4/20.
//

import Foundation

struct Pokemon{
    let name: String
    let baseExperience: Int
  //failable initializer
    init?(json: [String: Any]){
        guard let name = json["name"]as? String, let exp = json["base_experience"]as? Int else{return nil}
        
        self.name = name
        self.baseExperience = exp
        
        
    }
}

struct CodablePokemon: Decodable{
    let name : String
    let baseExperience: Int
    let abilities: [Ability]
    let species : [Species]
//an object is not codable or decodable if not all of its properties are
    
    //enums can have raw values
    //we indicate that withe case equal to string
    //if raw value is the sae name as the case it does not need to be
    //set
    //map key value to a variable
    enum CodingKeys: String, CodingKey{
        case name
        case baseExperience = "base_experience"
        case abilities
        case species
        
        
        
    }
}

//parsing dictionary
struct Ability: Decodable{
    let isHidden: Bool
    let name: String
    
    
    enum CodingKeys: String, CodingKey{
        case isHidden = "is_hidden"
        case ability
    
    }
    enum AbilityCodingKeys: String, CodingKey{
        case name
        
    }
    init(from decoder: Decoder)throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.isHidden = try container.decodeNil(forKey: .isHidden)
        let abilityContainer = try container.nestedContainer(keyedBy: AbilityCodingKeys.self, forKey: .ability)
        self.name = try abilityContainer.decode(String.self,forKey: .name)
        
    }

}

struct AbilityContainer: Decodable{
    let name: String
}

struct Species: Decodable{
    let name : String
    let url : String
    
    enum Codingkeys: String, CodingKey{
        case name
        case url
    }
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: Codingkeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.url = try container.decode(String.self, forKey: .url)
    }
}

struct Sprites: Decodable{
    let backDefault: String
    let blackFemale: String
    let blackShiny: String
    let blackShinyFemale: String
    let frontDefault: String
    let frontFemale: String
    let frontShiny: String
    let frontShinyFemale: String
    
    enum CodingKeys : String, CodingKey{
        case backDefault = "black_default"
        case blackFemale = "black_female"
        case blackShiny = "black_shiny"
        case blackShinyFemale = "black_shiny_female"
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
    }
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.backDefault = try container.decode(String.self, forKey: .backDefault)
        self.blackFemale = try container.decode(String.self, forKey: .blackFemale)
        self.blackShiny = try container.decode(String.self, forKey: .blackShiny)
        self.blackShinyFemale = try container.decode(String.self, forKey: .blackShinyFemale)
        self.frontDefault = try container.decode(String.self, forKey: .frontDefault)
        self.frontFemale = try container.decode(String.self, forKey: .frontFemale)
        self.frontShiny = try container.decode(String.self, forKey: .frontShiny)
        self.frontShinyFemale = try container.decode(String.self, forKey: .frontShinyFemale)
        
    }

}


