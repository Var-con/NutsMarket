//
//  MarketPresenter.swift
//  NutsMarket
//
//  Created by Станислав Климов on 12.09.2020.
//  Copyright © 2020 Stanislav Klimov. All rights reserved.
//

import Foundation

class MarketPresenter: MarketOutputProtocol {
    
    
    unowned var view: MarketInputProtocol
    var nutsCount: Int {
        return nuts.count
    }
    var nut: NutItem? {
        guard let indexPath = indexPath else {return nil}
        return getNut(at: indexPath)
    }
    var interactor: MarketInteractorInputProtocol!
    var router: MarketRouterProtocol!
    private var nuts: [NutItem] = []
    private var indexPath: IndexPath?
    
    required init(view: MarketInputProtocol) {
        self.view = view
    }
    
    func getNutsCollection() {
        interactor.fetchNuts()
    }
    func selectItem(at indexPath: IndexPath) {
        self.indexPath = indexPath
    }
    
    func getNut(at indexPath: IndexPath) -> NutItem {
            nuts[indexPath.row]

    }
    
    func showDetailVC() {
        guard let nutItem = nut else { return }
        router.openDetailVC(with: nutItem)
    }
    
    func showOrderPage() {
        router.openOrderPage()
    }
    
    func setCartImage() {
        interactor.getCartImage()
        
    }
}

extension MarketPresenter: MarketInteractorOutputProtocol {
    func nutsCollectionDidReceive(nuts: [NutItem]) {
        self.nuts = nuts
        view.reloadData()
    }
    
    func displayCartImage(with bool: Bool) {
        view.displayCartImage(with: bool)
    }
    
    
}
