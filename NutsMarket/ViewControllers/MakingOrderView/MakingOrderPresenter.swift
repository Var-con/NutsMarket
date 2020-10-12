//
//  MakingOrderPresenter.swift
//  NutsMarket
//
//  Created by Станислав Климов on 11.10.2020.
//  Copyright © 2020 Stanislav Klimov. All rights reserved.
//

import Foundation

class MakingOrderPresenter: MakingOrderVCOutputProtocol {
    
    unowned var view: MakingOrderVCInputProtocol
    var interactor: MakingOrderInteractorInputProtocol!
    
    required init(view: MakingOrderVCInputProtocol) {
        self.view = view
    }
    
}



extension MakingOrderPresenter: MakingOrderInteractorOutputProtocol {
    
}
