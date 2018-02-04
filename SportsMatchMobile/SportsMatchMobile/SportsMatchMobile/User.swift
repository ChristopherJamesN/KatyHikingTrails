//
//  User.swift
//  SportsMatchMobile
//
//  Created by Christopher Nady on 2/4/18.
//  Copyright © 2018 Nady Analytics, LLC. All rights reserved.
//

import UIKit

class User {
    var email: String
    var points: Int
    
    init?(email:String, points:Int) {
        if email.isEmpty || points < 0 {
            return nil
        }
        self.email = email
        self.points = points
    }
}
