//
//  DetailInteractor.swift
//  NutsMarket
//
//  Created by Станислав Климов on 12.09.2020.
//  Copyright © 2020 Stanislav Klimov. All rights reserved.
//

import Foundation

protocol DetailViewInteractorInputProtocol: class {
    init(presenter: DetailViewInteractorOutputProtocol, and nut: NutItem)
    func displayInformation()
    func addNutToCart(with count: String)
}

protocol DetailViewInteractorOutputProtocol: class {
    func displayNutInfo(with nut: NutItem)
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
    }
    
    func addNutToCart(with count: String) {
        guard let countInt = Int(count) else { return }
        
    }
    
}
