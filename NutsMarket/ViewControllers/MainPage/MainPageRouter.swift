//
//  MainPageRouter.swift
//  NutsMarket
//
//  Created by Станислав Климов on 09.09.2020.
//  Copyright © 2020 Stanislav Klimov. All rights reserved.
//

import Foundation

protocol MainPageRouterProtocol {
    
    init(viewcontroller: MainPageView)
    func displayRegisterView()
    func displayMarketView()
    func displayForgottenPasswordView()
}

class MainpageRouter: MainPageRouterProtocol {
    
    unowned let viewController: MainPageView
    
    
    required init(viewcontroller: MainPageView) {
        self.viewController = viewcontroller
    }
    
    func displayRegisterView() {
        viewController.performSegue(withIdentifier: "registerViewSegue", sender: nil)
    }
    
    func displayMarketView() {
        viewController.performSegue(withIdentifier: "marketSegue", sender: nil)
    }
    
    func displayForgottenPasswordView() {
        viewController.performSegue(withIdentifier: "forgotPasswordSegue", sender: nil)
    }
    
    
    
}
