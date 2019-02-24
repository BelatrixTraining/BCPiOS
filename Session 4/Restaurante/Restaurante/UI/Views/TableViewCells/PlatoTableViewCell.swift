//
//  PlatoTableViewCell.swift
//  Restaurante
//
//  Created by Arturo Gamarra on 2/23/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//

import UIKit

class PlatoTableViewCell: UITableViewCell {
    
    static let identifier = "PlatoCompletoCell"
    
    @IBOutlet weak var platoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var plato:Plato! {
        didSet {
            platoImageView.image = plato.image
            nameLabel.text = plato.name
            detailLabel.text = plato.detail
            priceLabel.text = "S/ \(plato.price)"
        }
    }
    
}
