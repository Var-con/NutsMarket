//
//  ProductCollectionViewCell.swift
//  NutsMarket
//
//  Created by Станислав Климов on 12.09.2020.
//  Copyright © 2020 Stanislav Klimov. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet var imageOutlet: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
      func configure(with nut: NutItem?) {
        
        nameLabel.text = nut?.name 
        priceLabel.text = "\(nut?.price ?? 0)"
        guard let data = ImageManager.shared.getImageData(from: nut?.imageUrl) else { return }
        imageOutlet.image = UIImage(data: data)
      }

}
