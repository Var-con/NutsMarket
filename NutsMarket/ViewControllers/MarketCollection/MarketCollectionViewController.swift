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
}

protocol MarketOutputProtocol {
    init(view: MarketInputProtocol)
    func getNutsCollection()
    var nutsCount: Int { get }
    var nut: NutItem? { get }
    func selectItem(at indexPath: IndexPath)
    func showDetailVC()
}

class MarketCollectionViewController: UICollectionViewController {
    
    var presenter: MarketOutputProtocol!
    private let configurator: MarketConfugurator = MarketConfugurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getNutsCollection()
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
        let detailVC = segue.destination as! DetailsViewController
        let configurator = DetailViewConfigurator()
        configurator.configure(with: detailVC, and: sender as! NutItem)
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
}

