//
//  MainPagePresenter.swift
//  NutsMarket
//
//  Created by Станислав Климов on 08.09.2020.
//  Copyright © 2020 Stanislav Klimov. All rights reserved.
//

import Foundation

class MainPagePresenter: MainPageViewOutputProtocol {
    
    unowned var view: MainPageViewInputProtocol
    var interactor: MainPageViewInteractorInputProtocol!
    var router: MainPageRouterProtocol!
    
    
    required init(view: MainPageViewInputProtocol) {
        self.view = view
    }
    
    func loginButtonPressed(with login: String, password: String) {
        interactor.authInApp(with: login, password: password)
    }
    
    func displayRegisterView() {
        router.displayRegisterView()
    }
}


extension MainPagePresenter: MainPageViewInteractorOutputProtocol {
    func displayMarketView() {
        router.displayMarketView()
    }
    
    func displayErrorAlert() {
        
    }
    
    
}
