//
//  HomeFlowVC.swift
//  pokemon-emin-task
//
//  Created by Emin Hayal on 21.04.2022.
//

import UIKit

class HomeFlowVC: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: HomeFlowVM!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }
    private func setupUI() {
        self.navigationItem.title = "Pokemon Emin Task"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HomeFlowCell.nibName, forCellReuseIdentifier: HomeFlowCell.identifier)
    }
}



extension HomeFlowVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeFlowCell.identifier, for: indexPath) as! HomeFlowCell
        return cell
    }
    
    
}

extension HomeFlowVC: StoryboardInstantiate {
    static var storyboardType: StoryboardType { return .home }
}
