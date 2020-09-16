//
//  RegisterViewConfigurator.swift
//  NutsMarket
//
//  Created by Станислав Климов on 08.09.2020.
//  Copyright © 2020 Stanislav Klimov. All rights reserved.
//

import Foundation

protocol RegisterViewConfiguratorProtocol {
    func congigure(view: RegisterScreenViewController)
}

class RegisterViewConfigurator: RegisterViewConfiguratorProtocol {
    func congigure(view: RegisterScreenViewController) {
        let presenter = RegisterViewPresenter(view: view)
        let interactor = RegisterViewInteractor(presenter: presenter)
        view.presenter = presenter
        presenter.interactor = interactor
    }
}

