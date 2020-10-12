//
//  DetailsViewController.swift
//  NutsMarket
//
//  Created by Станислав Климов on 12.09.2020.
//  Copyright © 2020 Stanislav Klimov. All rights reserved.
//

import UIKit

protocol DetailsViewControllerInputProtocol: class {
    func displayInformation(name: String, description: String, price: Int, imageData: Data)
    func displayCartImage(with bool: Bool)
}

protocol DetailsViewControllerOutputProtocol {
    init(view: DetailsViewControllerInputProtocol)
    func setupScreen()
    func addToCartNut(with count: String)
    func displayOrderView()
    func setCartImage()
}

class DetailsViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var countTextField: UITextField!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var cartButtonOutlet: UIBarButtonItem!
    var presenter: DetailsViewControllerOutputProtocol!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setupScreen()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.setCartImage()
    }
    
    
    @IBAction func addToCartButton(_ sender: UIButton) {
        guard let count = countTextField.text else { return }
        presenter.addToCartNut(with: count)
    }
    @IBAction func cartButton(_ sender: UIBarButtonItem) {
        presenter.displayOrderView()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cartStorageFromDetails" {
            let orderVC = segue.destination as! OrderTableViewController
            let configurator = OrderViewConfigurator()
            configurator.configure(with: orderVC)
        }
    }
    
}

extension DetailsViewController: DetailsViewControllerInputProtocol {
    func displayInformation(name: String, description: String, price: Int, imageData: Data) {
        nameLabel.text = name
        descriptionLabel.text = description
        priceLabel.text = "Цена за килограмм: \(price)"
        imageView.image = UIImage(data: imageData)
    }
    
    func displayCartImage(with bool: Bool) {
        if bool {
            cartButtonOutlet.image = UIImage(systemName: "cart.fill")
        } else {
            cartButtonOutlet.image = UIImage(systemName: "cart")
        }
    }
}
