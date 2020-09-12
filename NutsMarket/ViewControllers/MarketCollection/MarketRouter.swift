//
//  MarketRouter.swift
//  NutsMarket
//
//  Created by Станислав Климов on 12.09.2020.
//  Copyright © 2020 Stanislav Klimov. All rights reserved.
//

import Foundation

protocol MarketRouterProtocol {
    init(view: MarketCollectionViewController)
    func openDetailVC(with nut: NutItem)
}

class MarketRouter: MarketRouterProtocol {
    
    unowned var view: MarketCollectionViewController
    
    required init(view: MarketCollectionViewController) {
        self.view = view
    }
    
    func openDetailVC(with nut: NutItem) {
        view.performSegue(withIdentifier: "detailsSegue", sender: nut)
    }
}
