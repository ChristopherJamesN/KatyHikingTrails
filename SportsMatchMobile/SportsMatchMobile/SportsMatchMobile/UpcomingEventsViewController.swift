//
//  UpcomingEventsViewController.swift
//  SportsMatchMobile
//
//  Created by Christopher Nady on 1/31/18.
//  Copyright © 2018 Nady Analytics, LLC. All rights reserved.
//

import UIKit

class UpcomingEventsViewController: UIViewController {
    
    @IBOutlet weak var UpcomingEventsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UpcomingEventsLabel.text = event1?.participants
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    let event1 = Event(participants: "Lakers versus Thunder", commence: 111234, status: "Ongoing", sport: "Basketball", winner: "Unknown")
}
