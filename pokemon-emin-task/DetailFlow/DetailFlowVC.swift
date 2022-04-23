//
//  DetailFlowVC.swift
//  pokemon-emin-task
//
//  Created by Emin Hayal on 21.04.2022.
//

import UIKit

class DetailFlowVC: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var bottomView: UIView!
    @IBOutlet weak var collectionViewLayout: UICollectionViewFlowLayout!
    
    @IBOutlet weak var typeClassLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var specialAtackLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var atackLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    var viewModel: DetailFlowProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.delegate = self
        viewModel.getPokemonDetail()
    }
    
    private func setupUI() {
        bottomView.layer.cornerRadius = 24
        bottomView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.register(DetailFlowCollectionCell.nibName, forCellWithReuseIdentifier: DetailFlowCollectionCell.identifier)
        collectionView.collectionViewLayout = setCollectionViewLayout()
    }
    
    fileprivate func setCollectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: self.view.bounds.width, height: collectionView.bounds.height)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        return layout
    }

}

extension DetailFlowVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.pokemonImage.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailFlowCollectionCell.identifier, for: indexPath) as! DetailFlowCollectionCell
        cell.setImageView(pokemonDetail: viewModel.pokemonImage[indexPath.row])
        return cell
    }
    
    

}


extension DetailFlowVC: DetailFlowDelegate {
    func showError(error: String) {
        print(error)
    }
    
    func reloadData(data: PokemonDetail) {
        self.nameLabel.text = data.name
        self.heightLabel.text = String(data.height)
        self.hpLabel.text = String(data.stats[0].baseStat)
        self.atackLabel.text = String(data.stats[1].baseStat)
        self.defenseLabel.text = String(data.stats[2].baseStat)
        self.specialAtackLabel.text = String(data.stats[3].baseStat)
        self.speedLabel.text = String(data.stats[5].baseStat)
        self.typeLabel.text = data.types[0].type.name
        self.typeClassLabel.text = data.types[1].type.name
        collectionView.reloadData()
        
    }
    
        
}

extension DetailFlowVC: StoryboardInstantiate {
    static var storyboardType: StoryboardType { return .detail }
}
