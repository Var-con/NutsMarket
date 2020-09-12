//
//  MatketConfigurator.swift
//  NutsMarket
//
//  Created by Станислав Климов on 12.09.2020.
//  Copyright © 2020 Stanislav Klimov. All rights reserved.
//

import Foundation

protocol MarketConfiguratorProtocol {
    func configure(with view: MarketCollectionViewController)
}

class MarketConfugurator: MarketConfiguratorProtocol {
    func configure(with view: MarketCollectionViewController) {
        let presenter = MarketPresenter(view: view)
        let interactor = MarketInteractor(presenter: presenter)
        let router = MarketRouter(view: view)
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }

}
