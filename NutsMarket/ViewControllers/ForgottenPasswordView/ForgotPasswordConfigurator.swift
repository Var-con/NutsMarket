//
//  ForgotPasswordConfigurator.swift
//  NutsMarket
//
//  Created by Станислав Климов on 10.09.2020.
//  Copyright © 2020 Stanislav Klimov. All rights reserved.
//

import Foundation

protocol ForgotPasswordPageViewConfiguratorProtocol {
    func configure(with view: ForgotPasswordViewController)
}

class ForgotPasswordPageViewConfigurator: ForgotPasswordPageViewConfiguratorProtocol {
    func configure(with view: ForgotPasswordViewController) {
        let presenter = ForgotPasswordPresenter(view: view)
        let interactor = ForgotPasswordInteractor(presenter: presenter)
        view.presenter = presenter
        presenter.interactor = interactor        
    }
    
    
}
