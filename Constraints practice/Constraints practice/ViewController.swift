//
//  ViewController.swift
//  Constraints practice
//
//  Created by Easton Butterfield on 9/21/22.
//

import UIKit
import RyansPokemonPackage

class ViewController: UIViewController {

    @IBOutlet weak var newPokemonButton: UIButton!
    @IBOutlet weak var pokemonNameLable: UILabel!
    @IBOutlet weak var pokemonImageView: UIImageView!
    
    @IBOutlet weak var typeStackView: UIStackView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        newPokemonButton.layer.cornerRadius = newPokemonButton.frame.height / 2
    }

    @IBAction func newPokemonButtonTapped(_ sender: Any) {
        Task {
            let pokemon = await getRandomPokemon(gen: .all)
            pokemonNameLable.text = pokemon.name
            pokemonImageView.setPokemon(pokemon: pokemon)
            for view in typeStackView.arrangedSubviews {
                view.removeFromSuperview()
            }
            for pType in pokemon.types {
                let lable = UILabel()
                lable.text = pType
                lable.text = pType.capitalized
                lable.textAlignment = .center
                typeStackView.addArrangedSubview(lable)
            }
        }
    }
    
}

