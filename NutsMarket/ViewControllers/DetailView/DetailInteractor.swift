//
//  DetailInteractor.swift
//  NutsMarket
//
//  Created by Станислав Климов on 12.09.2020.
//  Copyright © 2020 Stanislav Klimov. All rights reserved.
//

import Foundation
import Firebase

protocol DetailViewInteractorInputProtocol: class {
    init(presenter: DetailViewInteractorOutputProtocol, and nut: NutItem)
    func displayInformation()
    func addNutToCart(with count: String)
    func getBoolForCartImage()
}

protocol DetailViewInteractorOutputProtocol: class {
    func displayNutInfo(with nut: NutItem)
    func displayCartImage(with bool: Bool)
}

class DetailViewInteractor: DetailViewInteractorInputProtocol {
    
    unowned var presenter: DetailViewInteractorOutputProtocol
    private let nut: NutItem
    
    required init(presenter: DetailViewInteractorOutputProtocol, and nut: NutItem) {
        self.presenter = presenter
        self.nut = nut
    }
    
    func displayInformation() {
        presenter.displayNutInfo(with: nut)
        getBoolForCartImage()
    }
    
    func addNutToCart(with count: String) {
        guard let intCount = Int(count) else { return }
        CartManager.shared.addNutToCart(nut: nut, count: intCount)
    }
    
    
    func getBoolForCartImage() {
        CartManager.shared.getInformationAboutCartEmptyness { bool in
            self.presenter.displayCartImage(with: bool)
        }
    }
}
