//
//  ViewController.swift
//  NetowrkCalls
//
//  Created by Field Employee on 12/4/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("hello")
        parseDataCodable()
        
    }
    func parseDataSerialization(){
        guard let fileUrl = Bundle.main.url(forResource: "PokemonExample", withExtension: "json")else{return}
        print(fileUrl)
        guard let fileData = try?
                Data(contentsOf: fileUrl)else{return}
        print(fileData)
        guard let parsedJson = try? JSONSerialization.jsonObject(with: fileData, options: []) as? [String: Any]else{return}
        print(Pokemon(json: parsedJson)!)
        
    }
    func parseDataCodable(){
        guard let fileUrl = Bundle.main.url(forResource: "PokemonExample", withExtension: "json")else{return}
        print(fileUrl)
        guard let fileData = try?
                Data(contentsOf: fileUrl)else{return}
        print(fileData)
        let pokemon = try? JSONDecoder().decode(CodablePokemon.self, from: fileData)
        print(pokemon)
    }
}
