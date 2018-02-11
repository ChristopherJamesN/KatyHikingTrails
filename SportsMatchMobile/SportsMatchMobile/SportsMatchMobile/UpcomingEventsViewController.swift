//
//  UpcomingEventsViewController.swift
//  SportsMatchMobile
//
//  Created by Christopher Nady on 1/31/18.
//  Copyright © 2018 Nady Analytics, LLC. All rights reserved.
//

import UIKit

class UpcomingEventsViewController: UIViewController {
    
    @IBOutlet weak var UpcomingEventsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let session = URLSession.shared
        
        let eventsURL = URL(string:"https://sports-match.herokuapp.com/home.json")!
        
        let dataTask = session.dataTask(with: eventsURL) {
            (data: Data?, response: URLResponse?, error: Error?) in
            
            if let error = error {
                print("Error:\n\(error)")
            } else {
                if let data = data {
                    let json = try? JSONSerialization.jsonObject(with: data, options: [])
                    print(json!)
                    let jsonArray = json! as? Array<Any>
                    print(jsonArray![0])
                } else {
                    print("Error: did not receive data")
                }
            }
        }
        
        dataTask.resume()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
