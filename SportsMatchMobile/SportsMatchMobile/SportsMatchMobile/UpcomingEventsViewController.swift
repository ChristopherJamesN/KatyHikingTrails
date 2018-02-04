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
        UpcomingEventsLabel.text = "No upcoming events."

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
                    
                    if let jsonObj = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary {
                        
                        if let mainDictionary = jsonObj!.value(forKey: "main") as? NSDictionary {
                            if let particpants = mainDictionary.value(forKey: "participants") {
                                DispatchQueue.main.async {
                                    self.UpcomingEventsLabel.text = "\(particpants)"
                                }
                            }
                        } else {
                            print("Error: unable to find events in dictionary")
                        }
                    } else {
                        print("Error: unable to convert json data")
                    }
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
