//
//  OrderViewConfigurator.swift
//  NutsMarket
//
//  Created by Станислав Климов on 21.09.2020.
//  Copyright © 2020 Stanislav Klimov. All rights reserved.
//

import Foundation

protocol OrderViewConfiguratorProtocol {
    func configure(with view: OrderTableViewController)
}


class OrderViewConfigurator: OrderViewConfiguratorProtocol {
    func configure(with view: OrderTableViewController) {
        let presenter = OrderViewPresenter(view: view)
        let interactor = OrderViewInteractor(presenter: presenter)
        let router = OrderViewRouter(view: view)
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
    
    
}
