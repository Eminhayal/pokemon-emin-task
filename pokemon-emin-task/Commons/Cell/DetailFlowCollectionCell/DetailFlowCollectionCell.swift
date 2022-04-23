//
//  DetailFlowCollectionCell.swift
//  pokemon-emin-task
//
//  Created by Emin Hayal on 21.04.2022.
//

import UIKit

class DetailFlowCollectionCell: UICollectionViewCell {

    @IBOutlet weak var pokemonImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setImageView(pokemonDetail: String) {
        self.pokemonImageView.downloaded(from: pokemonDetail )
    }
}

extension DetailFlowCollectionCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nibName: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
