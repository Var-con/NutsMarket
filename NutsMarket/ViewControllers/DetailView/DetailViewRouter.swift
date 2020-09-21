//
//  DetailViewRouter.swift
//  NutsMarket
//
//  Created by Станислав Климов on 21.09.2020.
//  Copyright © 2020 Stanislav Klimov. All rights reserved.
//

import Foundation

protocol DetailViewRouterProtocol {
    init(view: DetailsViewController)
    func openOrderView()
}



class DetailViewRouter: DetailViewRouterProtocol {
    
    unowned var view: DetailsViewController
    
    required init(view: DetailsViewController) {
        self.view = view
    }
    
    func openOrderView() {
        view.performSegue(withIdentifier: "cartStorageFromDetails", sender: nil)
    }
    
    
}
