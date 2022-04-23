//
//  AppRouter.swift
//  pokemon-emin-task
//
//  Created by Emin Hayal on 21.04.2022.
//

import Foundation
import UIKit

final class AppRouter {
    
    static var shared = AppRouter()
    
    init() {}
    
    func showDetailPage(_ navigationController: UINavigationController?, pokemonDetailURL: String) {
        let vc = DetailFlowVC.instantiate()
        let vm = DetailFlowVM(url: pokemonDetailURL)
        vc.viewModel = vm
        navigationController?.pushViewController(vc, animated: true)
    }
}
