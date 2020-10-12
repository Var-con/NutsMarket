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
    var router: DetailViewRouter!
    required init(view: DetailsViewControllerInputProtocol) {
        self.view = view
    }
    func setupScreen() {
        interactor.displayInformation()
    }
    
    func setCartImage() {
        interactor.getCartImage()
    }
    
    func addToCartNut(with count: String) {
        interactor.addNutToCart(with: count)
    }
    
    func displayOrderView() {
        router.openOrderView()
    }
}

extension DetailsViewPresenter: DetailViewInteractorOutputProtocol {
    func displayCartImage(with bool: Bool) {
        view.displayCartImage(with: bool)
    }
    
    func displayNutInfo(with nut: NutItem, imageData: Data) {
        view.displayInformation(name: nut.name,
                                description: nut.description,
                                price: nut.price,
                                imageData: imageData)
        
    }
}
