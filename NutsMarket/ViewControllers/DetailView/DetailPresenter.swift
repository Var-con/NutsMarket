//
//  DetailPresenter.swift
//  NutsMarket
//
//  Created by Станислав Климов on 12.09.2020.
//  Copyright © 2020 Stanislav Klimov. All rights reserved.
//

import Foundation

class DetailsViewPresenter: DetailsViewControllerOutputProtocol {
    
    unowned var view: DetailsViewControllerInputProtocol
    var interactor: DetailViewInteractorInputProtocol!
    required init(view: DetailsViewControllerInputProtocol) {
        self.view = view
    }
    func setupScreen() {
        interactor.displayInformation()
    }
    
    func addToCartNut(with count: String) {
        interactor.addNutToCart(with: count)
    }
}

extension DetailsViewPresenter: DetailViewInteractorOutputProtocol {
    func displayCartImage(with bool: Bool) {
        view.displayCartImage(with: bool)
    }
    
    func displayNutInfo(with nut: NutItem) {
        view.displayInformation(name: nut.name,
                                description: nut.description,
                                price: nut.price)
        
    }
}
