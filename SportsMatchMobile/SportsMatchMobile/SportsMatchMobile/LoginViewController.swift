//
//  LoginViewController.swift
//  SportsMatchMobile
//
//  Created by Christopher Nady on 2/4/18.
//  Copyright © 2018 Nady Analytics, LLC. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    static let BASE_URL = "https://sports-match.herokuapp.com/"

    override func viewDidLoad() {
        super.viewDidLoad()
        EmailTextBox.text = "test@email.com"
        PasswordTextBox.text = "password"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var LoginLabel: UILabel!
    @IBOutlet weak var EmailTextBox: UITextField!
    @IBOutlet weak var PasswordTextBox: UITextField!
    @IBAction func LoginButton(_ sender: Any) {
        
    }
}
