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
    
    weak var presenter: OrderViewInteractorOutputProtocol?
    
    required init(presenter: OrderViewInteractorOutputProtocol) {
        self.presenter = presenter
    }

    func getOrderList() {
        CartManager.shared.getOrderFromCart { (orderedNuts) in
            if self.presenter != nil {
                self.presenter!.nutsOrderedListDidReceive(nuts: orderedNuts)
            }
        }
    }
    
    
}
