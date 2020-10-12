//
//  OrderViewRouter.swift
//  NutsMarket
//
//  Created by Станислав Климов on 12.10.2020.
//  Copyright © 2020 Stanislav Klimov. All rights reserved.
//

import Foundation

protocol OrderViewRouterProtocol {
    init(view: OrderTableViewController)
    
    func openMakingOrderVC()
}

class OrderViewRouter: OrderViewRouterProtocol {
    
    unowned var view: OrderTableViewController
    
    required init(view: OrderTableViewController) {
        self.view = view
    }
    
    func openMakingOrderVC() {
        view.performSegue(withIdentifier: "makeOrderSegue", sender: nil)
    }
}
