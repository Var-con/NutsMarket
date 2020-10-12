//
//  OrderViewPresenter.swift
//  NutsMarket
//
//  Created by Станислав Климов on 21.09.2020.
//  Copyright © 2020 Stanislav Klimov. All rights reserved.
//

import Foundation

class OrderViewPresenter: OrderVCOutputProtocol {
    
    
    
    
    unowned var view: OrderVCInputProtocol
    var interactor: OrderViewInteractorInputProtocol!
    var router: OrderViewRouterProtocol!
    var orderedNutsCount: Int {
        return nutsInCart.count
    }
    var nutsInCart: [OrderNut] = []
    var orderedNut: OrderNut? {
        guard let indexPath = indexPath else { return nil }
        return getNut(at: indexPath)
    }
    private var indexPath: IndexPath?
    
    
    required init(view: OrderVCInputProtocol) {
        self.view = view
    }
    
    func selectItem(with indexPath: IndexPath) {
        self.indexPath = indexPath
    }
    
    func getNut(at indexPath: IndexPath) -> OrderNut {
        nutsInCart[indexPath.row]
    }
    
    func getOrderedNutsList() {
        interactor.getOrderList()
    }
    
    func openMakingOrder() {
        router.openMakingOrderVC()
    }
    
}


extension OrderViewPresenter: OrderViewInteractorOutputProtocol {
    func nutsOrderedListDidReceive(nuts: [OrderNut]) {
        self.nutsInCart = nuts
        view.getPrice(from: self.nutsInCart)
        view.reloadData()
    }
    
    
    
}
