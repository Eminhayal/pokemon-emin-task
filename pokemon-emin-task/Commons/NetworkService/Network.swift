//
//  Network.swift
//  pokemon-emin-task
//
//  Created by Emin Hayal on 21.04.2022.
//


protocol Network {
    func getDownloadPokemon(url: String, completion: @escaping (Pokemon? , String?) -> Void)
    func getPokemonDetail(url: String, completion: @escaping (PokemonDetail? , String?) -> Void)
}

extension Api: Network {
    func getDownloadPokemon(url: String, completion: @escaping (Pokemon? , String?) -> Void) {
        network.getData(url: url) { [weak self] (response: Pokemon?, error: String?)   in
            completion(response, error)
        }
    }
    
    func getPokemonDetail(url: String, completion: @escaping (PokemonDetail? , String?) -> Void) {
        network.getData(url: url) { [weak self] (response: PokemonDetail?, error: String?)   in
            completion(response, error)
        }
    }
}
