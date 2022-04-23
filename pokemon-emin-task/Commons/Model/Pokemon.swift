//
//  Pokemon.swift
//  pokemon-emin-task
//
//  Created by Emin Hayal on 21.04.2022.
//

import Foundation

// MARK: - Pokemon
struct Pokemon: Codable {
    let count: Int
    let next, previous: String?
    let results: [PokemonResult]
}

// MARK: - Result
struct PokemonResult: Codable {
    let name: String
    let url: String
}
