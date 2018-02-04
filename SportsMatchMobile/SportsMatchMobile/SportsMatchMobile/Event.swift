//
//  Event.swift
//  SportsMatchMobile
//
//  Created by Christopher Nady on 2/4/18.
//  Copyright © 2018 Nady Analytics, LLC. All rights reserved.
//

import UIKit

class Event {
    var description: String
    var chance: Int
    var value: Int
    var category: String
    var event: String
    
    init?(description:String, chance:Int, value:Int, category:String, event:String) {
        if description.isEmpty || chance < 0 || value < 0 || category.isEmpty || event.isEmpty {
            return nil
        }
        self.description = description
        self.chance = chance
        self.value = value
        self.category = category
        self.event = event
    }
}
