//
//  Event.swift
//  SportsMatchMobile
//
//  Created by Christopher Nady on 2/4/18.
//  Copyright © 2018 Nady Analytics, LLC. All rights reserved.
//

import UIKit

class Event {
    var participants: String
    var commence: Int
    var status: String
    var sport: String
    var winner: String
    
    init?(participants:String, commence:Int, status:String, sport:String, winner:String) {
        if participants.isEmpty || commence < 0 || status.isEmpty || sport.isEmpty || winner.isEmpty {
            return nil
        }
        self.participants = participants
        self.commence = commence
        self.status = status
        self.sport = sport
        self.winner = winner
    }
}
