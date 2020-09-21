//
//  CollectionViewController.swift
//  NutsMarket
//
//  Created by Станислав Климов on 27.08.2020.
//  Copyright © 2020 Stanislav Klimov. All rights reserved.
//

import UIKit

protocol MarketInputProtocol: class {
    func reloadData()
    func displayCartImage(with bool: Bool)
}

protocol MarketOutputProtocol {
    init(view: MarketInputProtocol)
    func getNutsCollection()
    var nutsCount: Int { get }
    var nut: NutItem? { get }
    func selectItem(at indexPath: IndexPath)
    func showDetailVC()
    func setCartImage()
    func showOrderPage()
}

class MarketCollectionViewController: UICollectionViewController {
    
    @IBOutlet var cartButtonOutlet: UIBarButtonItem!
    var presenter: MarketOutputProtocol!
    private let configurator: MarketConfugurator = MarketConfugurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getNutsCollection()
        presenter.setCartImage()
    }

    @IBAction func cartButton(_ sender: UIBarButtonItem) {
        presenter.showOrderPage()
    }
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return presenter.nutsCount
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! ProductCollectionViewCell
        presenter.selectItem(at: indexPath)
        cell.configure(with: presenter.nut)
        return cell
    }

    // MARK: UICollectionViewDelegate
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsSegue" {
        let detailVC = segue.destination as! DetailsViewController
        let configurator = DetailViewConfigurator()
        configurator.configure(with: detailVC, and: sender as! NutItem)
        } else if segue.identifier == "cartStorage" {
            let orderVC = segue.destination as! OrderTableViewController
            let configurator = OrderViewConfigurator()
            configurator.configure(with: orderVC)
        }
    }
    
  

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.selectItem(at: indexPath)
        presenter.showDetailVC()
    }
    
    

}

extension MarketCollectionViewController: MarketInputProtocol {
    func reloadData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func displayCartImage(with bool: Bool) {
              if bool {
                  cartButtonOutlet.image = UIImage(systemName: "cart.fill")
              } else {
                  cartButtonOutlet.image = UIImage(systemName: "cart")
              }
    }
}

