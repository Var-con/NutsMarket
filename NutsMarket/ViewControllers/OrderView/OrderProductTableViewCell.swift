//
//  OrderProductTableViewCell.swift
//  NutsMarket
//
//  Created by Станислав Климов on 21.09.2020.
//  Copyright © 2020 Stanislav Klimov. All rights reserved.
//

import UIKit

class OrderProductTableViewCell: UITableViewCell {
    @IBOutlet var productImage: UIImageView!
    @IBOutlet var productNameLabel: UILabel!
    @IBOutlet var productCountLabel: UILabel!
    @IBOutlet var productPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    func configure(with orderedNut: OrderNut?) {
        productNameLabel.text = orderedNut?.nutName
        productCountLabel.text = ("\(String(describing: orderedNut?.nutCount))")
        productPriceLabel.text = ("\(String(describing: orderedNut?.nutPrice))")
    }

}
