//
//  MainPageViewConfigurator.swift
//  NutsMarket
//
//  Created by Станислав Климов on 08.09.2020.
//  Copyright © 2020 Stanislav Klimov. All rights reserved.
//

import Foundation

protocol MainPageViewConfiguratorProtocol {
    func configure(with view: MainPageView)
}

class MainPageViewConfigurator: MainPageViewConfiguratorProtocol {
    func configure(with view: MainPageView) {
        let presenter = MainPagePresenter(view: view)
        let interactor = MainPageViewInteractor(presenter: presenter)
        let router = MainpageRouter(viewcontroller: view)
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        
    }
    
    
}
