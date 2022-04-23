//
//  pokemon_emin_taskTests.swift
//  pokemon-emin-taskTests
//
//  Created by Emin Hayal on 21.04.2022.
//

import XCTest
@testable import pokemon_emin_task

class pokemon_emin_taskTests: XCTestCase {
    var vmOutputs: HomeRouteTest!
    var vmDelegate: HomeFlowVM!
    var mockNetwork: Network!
    
    override func setUp() {
        super.setUp()
        let vmOutputs = HomeRouteTest()
        self.vmOutputs = vmOutputs
        
        let mockApi: Network = MockApi()
        self.mockNetwork = mockApi
        
        let vmDelegate = HomeFlowVM()
        vmDelegate.delegate = vmOutputs
        vmDelegate.network = mockApi
        
        self.vmDelegate = vmDelegate
    }
    
    override func tearDown() {
        super.tearDown()
        
    }
    
    func test_get_data() {
        vmDelegate.getServiceData()
        XCTAssertTrue(vmOutputs.haveError)
    }
}

class HomeRouteTest: HomeFlowVMDelegateOutputs {
    var haveError: Bool = false
    func handleViewModelOutputs(_ viewModelOutputs: HomeFlowVMOutputs) {
        switch viewModelOutputs {
        case .Succes:
            break
        case .error(let string):
            haveError = true
        }
    }
    
    
}

class MockApi: Network {
    func getDownloadPokemon(url: String, completion: @escaping (Pokemon?, String?) -> Void) {
        completion(nil, "hata")
    }
    
    func getPokemonDetail(url: String, completion: @escaping (PokemonDetail?, String?) -> Void) {
        completion(nil, "hata")
        
    }
    
    
}
