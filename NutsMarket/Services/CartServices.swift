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
    
    func getInformationAboutCartEmptyness(complitionHandler: @escaping (_ exist: Bool) -> Void) {
         guard let user = Auth.auth().currentUser else { return }
            var bool = false
            let ref = Database.database().reference(withPath: "\(user.uid)").child("cart")
            ref.observe(.value) { snapshot in
                bool = snapshot.exists()
                complitionHandler(bool)
                }
        }
    
    
    func getOrderFromCart() -> [OrderNut]{
        var orderedNuts: [OrderNut] = []
        guard let user = Auth.auth().currentUser else { return [] }
        let ref = Database.database().reference(withPath: "\(user.uid)").child("cart")
        ref.observe(.value) { (dataSnapshot) in
            for item in dataSnapshot.children {
                let nut = OrderNut(snapshot: item as! FirebaseDatabase.DataSnapshot)
                orderedNuts.append(nut)
            }
        }
        return orderedNuts
    }
    
}
