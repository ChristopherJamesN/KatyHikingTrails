//
//  ThirdViewController.swift
//  SportsMatchMobile
//
//  Created by Christopher Nady on 1/28/18.
//  Copyright © 2018 Nady Analytics, LLC. All rights reserved.
//

import UIKit

class YourMatchesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var YourMatchesLabel: UILabel!
    
    @IBOutlet weak var MatchesTextInput: UITextField!
    @IBAction func DisaplyMatchesButton(_ sender: Any) {
        YourMatchesLabel.text = MatchesTextInput.text
    }
}
