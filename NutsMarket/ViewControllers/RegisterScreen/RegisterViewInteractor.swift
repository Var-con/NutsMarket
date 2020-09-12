//
//  RegisterViewInteractor.swift
//  NutsMarket
//
//  Created by Станислав Климов on 08.09.2020.
//  Copyright © 2020 Stanislav Klimov. All rights reserved.
//

import Foundation
import FirebaseAuth

protocol RegisterViewInteractorInputProtocol: class {
    func createUser(with login: String, password: String)
    
    init(presenter: RegisterViewInteractorOutputProtocol)
}

protocol RegisterViewInteractorOutputProtocol: class {
    func displaySuccsesfulAlert()
    func displayErrorAlert(with code: String)
}


class RegisterViewInteractor: RegisterViewInteractorInputProtocol {
    
    unowned let presenter: RegisterViewInteractorOutputProtocol
    
    required init(presenter: RegisterViewInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    func createUser(with login: String, password: String) {
        Auth.auth().createUser(withEmail: login,
                               password: password) { (user, error) in
                                if error == nil {
                                    if user != nil {
                                        self.presenter.displaySuccsesfulAlert()
                                    }
                                } else {
                                    print(error!.localizedDescription)
                                    self.presenter.displayErrorAlert(with: error!.localizedDescription)
                                }
        }
    }
}
