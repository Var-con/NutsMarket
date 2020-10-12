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
    func getCartImage()
    var cartManager: CartManager? { get }
}

protocol DetailViewInteractorOutputProtocol: class {
    func displayNutInfo(with nut: NutItem, imageData: Data)
    func displayCartImage(with bool: Bool)
}

class DetailViewInteractor: DetailViewInteractorInputProtocol {
    
    unowned var presenter: DetailViewInteractorOutputProtocol
    private let nut: NutItem
    var cartManager: CartManager?
    
    required init(presenter: DetailViewInteractorOutputProtocol, and nut: NutItem) {
        self.presenter = presenter
        self.nut = nut
    }
    
    func displayInformation() {
        if let imageData = ImageManager.shared.getImageData(from: nut.imageUrl) {
            presenter.displayNutInfo(with: nut, imageData: imageData)
        }
        getBoolForCartImage()
    }
    
    func getCartImage() {
        CartManager.shared.getInformationAboutCartEmptyness { [weak self] (bool) in
            self?.presenter.displayCartImage(with: bool)
        }
    }
    
    func addNutToCart(with count: String) {
        guard let intCount = Int(count) else { return }
        CartManager.shared.addNutToCart(nut: nut, count: intCount)
    }
    
    
    func getBoolForCartImage() {
        cartManager?.getInformationAboutCartEmptyness(complitionHandler: { (bool) in
            self.presenter.displayCartImage(with: bool)
        })
    }
}
