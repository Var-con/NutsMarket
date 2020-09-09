//
//  MainPageCiewControllerInteractor.swift
//  NutsMarket
//
//  Created by Станислав Климов on 08.09.2020.
//  Copyright © 2020 Stanislav Klimov. All rights reserved.
//

import Foundation
import FirebaseAuth

protocol MainPageViewInteractorOutputProtocol: class {
    func displayErrorAlert()
    func displayMarketView()
}

protocol MainPageViewInteractorInputProtocol: class {
    func authInApp(with login: String, password: String)
    init(presenter: MainPageViewInteractorOutputProtocol)
}

class MainPageViewInteractor: MainPageViewInteractorInputProtocol {
    
    
    
    unowned let presenter: MainPageViewInteractorOutputProtocol
    
    required init(presenter: MainPageViewInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    
    func authInApp(with login: String, password: String) {
        Auth.auth().signIn(withEmail: login, password: password) { (user, error) in
            if error == nil {
                if user != nil {
                    //добавить переход через роутер
                    self.presenter.displayMarketView()
                }
            } else {
                guard let error = error else { return }
                print(error.localizedDescription)
                //обработка ошибки в вью через презентер
                self.presenter.displayErrorAlert()
            }
        }
    }
}

