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
                    let dataString = String(data: data, encoding: String.Encoding.utf8)
                    print("All the upcoming event data:\n\(dataString!)")
                    let dataStringArray = dataString?.split(separator: "}")
                    print(dataStringArray![0])
                } else {
                    print("Error: did not receive data")
                }
                for i in 1...3 {
                    print(data!)
                }
            }
        }
        
        dataTask.resume()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
