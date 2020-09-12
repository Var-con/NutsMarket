//
//  DetailsViewController.swift
//  NutsMarket
//
//  Created by Станислав Климов on 12.09.2020.
//  Copyright © 2020 Stanislav Klimov. All rights reserved.
//

import UIKit

protocol DetailsViewControllerInputProtocol: class {
    func displayInformation(name: String, description: String, price: Int)
}

protocol DetailsViewControllerOutputProtocol {
    init(view: DetailsViewControllerInputProtocol)
    func setupScreen()
    func addToCartNut(with count: String)
}

class DetailsViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var countTextField: UITextField!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    var presenter: DetailsViewControllerOutputProtocol!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setupScreen()
    }
    
    
    @IBAction func addToCartButton(_ sender: UIButton) {
        guard let count = countTextField.text else { return }
        presenter.addToCartNut(with: count)
    }
    
}

extension DetailsViewController: DetailsViewControllerInputProtocol {
    func displayInformation(name: String, description: String, price: Int) {
        nameLabel.text = name
        descriptionLabel.text = description
        priceLabel.text = "Цена за килограмм: \(price)"
    }
}
