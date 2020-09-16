//
//  CartServices.swift
//  NutsMarket
//
//  Created by Станислав Климов on 16.09.2020.
//  Copyright © 2020 Stanislav Klimov. All rights reserved.
//

import Foundation
import Firebase

class CartManager {
    
    static let shared = CartManager()
    private init() {}
    
    func addNutToCart(nut: NutItem, count: Int) {
        guard let user = Auth.auth().currentUser else { return }
        let ref = Database.database().reference(withPath: "\(user.uid)").child("cart").child("\(nut.name)")
        ref.setValue(["nutName" : nut.name, "nutPrice" : nut.price, "nutCount" : count])
    }
    
    func getInformationAboutCartEmptyness() -> Bool {
         guard let user = Auth.auth().currentUser else { return false }
            var bool = false
            let ref = Database.database().reference(withPath: "\(user.uid)").child("cart")
            ref.observe(.value) { snapshot in
                bool = snapshot.exists()
                }
        return bool
        }
    
}
