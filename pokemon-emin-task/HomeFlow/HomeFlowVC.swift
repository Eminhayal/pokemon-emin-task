//
//  HomeFlowVC.swift
//  pokemon-emin-task
//
//  Created by Emin Hayal on 21.04.2022.
//

import UIKit

class HomeFlowVC: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel = HomeFlowVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }
    private func setupUI() {
        self.navigationItem.title = "anabaslik".localize
        tableView.delegate = self
        tableView.dataSource = self
        viewModel.delegate = self
        viewModel.getServiceData()
        tableView.register(HomeFlowCell.nibName, forCellReuseIdentifier: HomeFlowCell.identifier)
    }
}



extension HomeFlowVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return app.pokemon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        viewModel.getAppendingData(index: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeFlowCell.identifier, for: indexPath) as! HomeFlowCell
        cell.denemee.text = app.pokemon[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AppRouter.shared.showDetailPage(self.navigationController, pokemonDetailURL: app.pokemon[indexPath.row].url)
    }
    
}
extension HomeFlowVC: HomeFlowVMDelegateOutputs {
    func handleViewModelOutputs(_ viewModelOutputs: HomeFlowVMOutputs) {
        switch viewModelOutputs {
        case .Succes:
            self.tableView.reloadData()
            //self.resultPokemon = pokemon.results
        case .error(let string):
            let alert = UIAlertAction(title: "Hata", style: .cancel, handler: { _ in })
            //self.present(alert, animated: true, completion: nil)
        }
    }
    
    
}

extension HomeFlowVC: StoryboardInstantiate {
    static var storyboardType: StoryboardType { return .home }
}
