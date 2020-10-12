//
//  MakingOrderInteractor.swift
//  NutsMarket
//
//  Created by Станислав Климов on 11.10.2020.
//  Copyright © 2020 Stanislav Klimov. All rights reserved.
//

import Foundation

protocol MakingOrderInteractorInputProtocol: class {
    init(presenter: MakingOrderInteractorOutputProtocol)
}

protocol MakingOrderInteractorOutputProtocol: class {
    
}


class MakingOrderInteractor: MakingOrderInteractorInputProtocol {
    
    unowned var presenter: MakingOrderInteractorOutputProtocol
    
    required init(presenter: MakingOrderInteractorOutputProtocol) {
        self.presenter = presenter
    }
}
