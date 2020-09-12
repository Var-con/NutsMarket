//
//  ForgotenPasswordPresenter.swift
//  NutsMarket
//
//  Created by Станислав Климов on 10.09.2020.
//  Copyright © 2020 Stanislav Klimov. All rights reserved.
//

import Foundation

class ForgotPasswordPresenter: ForgotPasswordViewControllerOutputProtocol {
    
    unowned var view: ForgotPasswordViewControllerInputProtocol
    var interactor: ForgotPasswordInteractorInputProtocol!
    
    required init(view: ForgotPasswordViewControllerInputProtocol) {
        self.view = view
    }
    
    func sendPassword(with email: String) {
        interactor.sendPassword(with: email)
    }
}
    
extension ForgotPasswordPresenter: ForgotPasswordInteractorOutputProtocol {
    func showSuccsessAlert() {
        view.showSuccsessAlert()
    }
}
