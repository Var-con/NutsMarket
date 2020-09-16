//
//  User.swift
//  NutsMarket
//
//  Created by Станислав Климов on 12.09.2020.
//  Copyright © 2020 Stanislav Klimov. All rights reserved.
//

import Foundation
import Firebase

struct AppUser {
    let uid: String
    let email: String
    let fullName: String
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email!
        self.fullName = user.displayName ?? ""
    }
}
