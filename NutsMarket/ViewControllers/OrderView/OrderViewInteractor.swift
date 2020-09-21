//
//  OrderViewInteractor.swift
//  NutsMarket
//
//  Created by Станислав Климов on 21.09.2020.
//  Copyright © 2020 Stanislav Klimov. All rights reserved.
//

import Foundation


protocol OrderViewInteractorInputProtocol: class {
    init(presenter: OrderViewInteractorOutputProtocol)
    func getOrderList()
}

protocol OrderViewInteractorOutputProtocol: class {
    func nutsOrderedListDidReceive(nuts: [OrderNut])
    
}


class OrderViewInteractor: OrderViewInteractorInputProtocol {
    
    unowned var presenter: OrderViewInteractorOutputProtocol
    
    
    required init(presenter: OrderViewInteractorOutputProtocol) {
        self.presenter = presenter
    }

    func getOrderList() {

        let orderedNuts = CartManager.shared.getOrderFromCart()
        
        self.presenter.nutsOrderedListDidReceive(nuts: orderedNuts)
        
    }
    
    
    
}
