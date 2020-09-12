//
//  RegisterViewPresenter.swift
//  NutsMarket
//
//  Created by Станислав Климов on 08.09.2020.
//  Copyright © 2020 Stanislav Klimov. All rights reserved.
//

import Foundation

class RegisterViewPresenter: RegisterScreenViewOutputProtocol {
    
    
    unowned var view: RegisterScreenViewInputProtocol
    var interactor: RegisterViewInteractorInputProtocol!
    
    required init(view: RegisterScreenViewInputProtocol) {
        self.view = view
    }
    
    func registerUser(with email: String, password: String) {
        interactor.createUser(with: email, password: password)
    }
}

extension RegisterViewPresenter: RegisterViewInteractorOutputProtocol {
    func displayErrorAlert(with code: String) {
        let title = "Ошибка создания пользователя"
        if code == "The password must be 6 characters long or more." {
            view.displayErrorAlert(title,
                                   text: "Длина пароля должна быть не меньше 6 символов.")
        } else if code == "The email address is already in use by another account."{
            view.displayErrorAlert(title,
                                   text: "Пользователь с таким email уже зарегистрирован.")
        } else if code == "An email address must be provided."{
            view.displayErrorAlert(title,
                                   text: "Проверьте правильность введенного email.")
        }
    }
    
    func displaySuccsesfulAlert() {
        view.displaySuccsesAlert()
    }
}

