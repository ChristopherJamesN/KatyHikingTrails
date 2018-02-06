//
//  ThirdViewController.swift
//  SportsMatchMobile
//
//  Created by Christopher Nady on 1/28/18.
//  Copyright © 2018 Nady Analytics, LLC. All rights reserved.
//

import UIKit

class YourMatchesViewController: UIViewController {
    
    @IBOutlet weak var YourMatchesTableView: UITableView!
    @IBOutlet weak var YourMatchesLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    let match1 = Match(description: "First match", chance: 15, value: 10, category: "Basketball", event: "Lakers versus Thunder")
}
