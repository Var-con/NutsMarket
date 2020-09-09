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
                                        //отобразить алерт с уведомлением о том что успешно создан
                                    }
                                } else {
                                    print(error!.localizedDescription)
                                }
        }
    }
    
}
