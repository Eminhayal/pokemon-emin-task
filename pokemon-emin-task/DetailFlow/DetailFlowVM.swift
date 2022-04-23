//
//  DetailFlowVM.swift
//  pokemon-emin-task
//
//  Created by Emin Hayal on 21.04.2022.
//

import Foundation

protocol DetailFlowProtocol {
    var delegate: DetailFlowDelegate? { get set }
    func getPokemonDetail()
    var pokemonImage: [String] { get set}

}

protocol DetailFlowDelegate {
    func showError(error: String)
    func reloadData(data: PokemonDetail)
}

final class DetailFlowVM: DetailFlowProtocol {
    var delegate: DetailFlowDelegate?
    var pokemonImage: [String] = []
    private let network: Network = Api()
    
    private let url: String
    init(url: String) {
        self.url = url
    }
    
    func getPokemonDetail() {
        network.getPokemonDetail(url: url, completion: { [weak self] (response, error) in
            guard let self = self else { return }
            if let response = response {
                if let image = response.sprites.frontDefault {
                    self.pokemonImage.append(image)
                }
                if let image = response.sprites.backDefault {
                    self.pokemonImage.append(image)
                }
                if let image = response.sprites.backShiny {
                    self.pokemonImage.append(image)
                }
                if let image = response.sprites.frontShiny {
                    self.pokemonImage.append(image)
                }
                self.delegate?.reloadData(data: response)
            } else {
                self.delegate?.showError(error: error ?? "")
            }
        })
    }
}
