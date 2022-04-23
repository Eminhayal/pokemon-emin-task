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
    //MARK: Label Localization
    
    @IBOutlet private weak var statLocalizationLabel: UILabel!
    @IBOutlet private weak var atackLocalizationLabel: UILabel!
    @IBOutlet private weak var nameLocalizationLabel: UILabel!
    @IBOutlet private weak var heightLocalizationLabel: UILabel!
    @IBOutlet private weak var hpLocalizationLabel: UILabel!
    @IBOutlet private weak var defenseLocalizationLabel: UILabel!
    @IBOutlet private weak var specialLocalizationLabel: UILabel!
    @IBOutlet private weak var speedLocalizationLabel: UILabel!
    @IBOutlet private weak var typeLocalizationLabel: UILabel!
    @IBOutlet private weak var typeClassLocalizationLabel: UILabel!
    //MARK: LABEL VALUE
    @IBOutlet private weak var typeClassLabel: UILabel!
    @IBOutlet private weak var typeLabel: UILabel!
    @IBOutlet private weak var speedLabel: UILabel!
    @IBOutlet private weak var specialAtackLabel: UILabel!
    @IBOutlet private weak var defenseLabel: UILabel!
    @IBOutlet private weak var hpLabel: UILabel!
    @IBOutlet private weak var atackLabel: UILabel!
    @IBOutlet private weak var heightLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    var viewModel: DetailFlowProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.delegate = self
        viewModel.getPokemonDetail()
    }
    
    private func setupUI() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.register(DetailFlowCollectionCell.nibName, forCellWithReuseIdentifier: DetailFlowCollectionCell.identifier)
        collectionView.collectionViewLayout = setCollectionViewLayout()
        setText()
        
    }
    
    private func setText() {
        statLocalizationLabel.text = "Stat".localize
        nameLocalizationLabel.text = "Name".localize
        heightLocalizationLabel.text = "Height".localize
        hpLocalizationLabel.text = "Hp".localize
        atackLocalizationLabel.text = "Atack".localize
        defenseLocalizationLabel.text = "Defense".localize
        specialLocalizationLabel.text = "Special Atack".localize
        speedLocalizationLabel.text = "Speed".localize
        typeLocalizationLabel.text = "Type".localize
        typeClassLocalizationLabel.text = "Type Class".localize
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
