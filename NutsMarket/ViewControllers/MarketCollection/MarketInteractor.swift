//
//  MarketInteractor.swift
//  NutsMarket
//
//  Created by Станислав Климов on 12.09.2020.
//  Copyright © 2020 Stanislav Klimov. All rights reserved.
//

import Foundation
import FirebaseDatabase

protocol MarketInteractorInputProtocol: class {
    init(presenter: MarketInteractorOutputProtocol)
    func fetchNuts()
}

protocol MarketInteractorOutputProtocol: class {
    func nutsCollectionDidReceive(nuts: [NutItem])
}

class MarketInteractor: MarketInteractorInputProtocol {
    
    unowned let presenter: MarketInteractorOutputProtocol
    
    required init(presenter: MarketInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    func fetchNuts() {
        var nuts = Array<NutItem>()
        
        let ref = Database.database().reference(withPath: "app").child("nuts")
        ref.observe(.value) { (snapshot) in
            for item in snapshot.children {
                let nut = NutItem(snapshot: item as! FirebaseDatabase.DataSnapshot)
                nuts.append(nut)
            }
            
            self.presenter.nutsCollectionDidReceive(nuts: nuts)
        }
    }
    
}

