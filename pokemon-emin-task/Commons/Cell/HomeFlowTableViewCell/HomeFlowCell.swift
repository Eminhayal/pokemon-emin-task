//
//  HomeFlowCell.swift
//  pokemon-emin-task
//
//  Created by Emin Hayal on 21.04.2022.
//

import UIKit

class HomeFlowCell: UITableViewCell {
    
    @IBOutlet weak var denemee: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nibName: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}

