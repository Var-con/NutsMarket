//
//  ForgotPasswordInteractor.swift
//  NutsMarket
//
//  Created by Станислав Климов on 10.09.2020.
//  Copyright © 2020 Stanislav Klimov. All rights reserved.
//

import Foundation
import FirebaseAuth

protocol ForgotPasswordInteractorOutputProtocol: class {
    func showSuccsessAlert()
}


protocol ForgotPasswordInteractorInputProtocol: class {
    init(presenter: ForgotPasswordInteractorOutputProtocol)
    func sendPassword(with email: String)
}

class ForgotPasswordInteractor: ForgotPasswordInteractorInputProtocol {
    
    
    var presenter: ForgotPasswordInteractorOutputProtocol
    required init(presenter: ForgotPasswordInteractorOutputProtocol) {
        self.presenter = presenter
    }
    func sendPassword(with email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if error != nil {
                // отобразить алерт об ошибке
            } else {
                //отобразить алерт об отправке email
                self.presenter.showSuccsessAlert()
            }
        }
    }
    
}
