//
//  NutModel.swift
//  NutsMarket
//
//  Created by Станислав Климов on 12.09.2020.
//  Copyright © 2020 Stanislav Klimov. All rights reserved.
//

import Foundation
import Firebase

struct NutItem {
    let name: String
    let description: String
    let price: Int
    let imageUrl: String
    let ref: DatabaseReference?
    
    init(name: String, description: String, price: Int, imageUrl: String) {
        self.name = name
        self.description = description
        self.price = price
        self.imageUrl = imageUrl
        self.ref = nil
    }
    
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String : AnyObject]
        name = snapshotValue["name"] as! String
        description = snapshotValue["description"] as! String
        price = snapshotValue["price"] as! Int
        imageUrl = snapshotValue["imageUrl"] as! String
        ref = snapshot.ref
    }
    
}
