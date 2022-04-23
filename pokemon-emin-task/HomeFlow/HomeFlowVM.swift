//
//  HomeFlowVM.swift
//  pokemon-emin-task
//
//  Created by Emin Hayal on 21.04.2022.
//

import Foundation


protocol HomeFlowVMProtocol: AnyObject {
    
}

protocol HomeFlowVMDelegate: HomeFlowVMProtocol {
    var delegate: HomeFlowVMDelegateOutputs? { get set }
    func getServiceData()
    func getAppendingData(index: Int)
}

protocol HomeFlowVMDelegateOutputs: AnyObject{
    func handleViewModelOutputs(_ viewModelOutputs: HomeFlowVMOutputs )
    
}

enum HomeFlowVMOutputs {
    case Succes
    case error(String)
}

class HomeFlowVM: HomeFlowVMDelegate {
    var delegate: HomeFlowVMDelegateOutputs?
    var nextPage: String = "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=20"
    var network: Network = Api()
    var serviceIsCalled: Bool = false
    
    
    func getAppendingData(index: Int) { // 16
        let totalCount = app.pokemon.count // 20
        let oran: Double = Double(index) / Double(totalCount)
        
        if oran > 0.7 {
            getServiceData()
        }
    }
    
    func getServiceData() {
        if serviceIsCalled {
            return
        }
        serviceIsCalled = true
        network.getDownloadPokemon(url: nextPage) { [weak self] (response, err) in
            guard let self = self else { return }
            self.serviceIsCalled = false
            if let response = response {
                self.nextPage = response.next ?? ""
                self.prepareNewData(data: response.results)
                self.delegate?.handleViewModelOutputs(.Succes)
            }else {
                self.delegate?.handleViewModelOutputs(.error(err ?? ""))
            }
        }
    }
    
    func prepareNewData(data: [PokemonResult]) {
        app.pokemon.append(contentsOf: data)
    }
    
    
    private func handleViewModelOutputs(_ type: HomeFlowVMOutputs) {
        self.delegate?.handleViewModelOutputs(type)
    }
}
