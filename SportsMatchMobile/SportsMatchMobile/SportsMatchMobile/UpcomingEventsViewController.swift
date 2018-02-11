//
//  UpcomingEventsViewController.swift
//  SportsMatchMobile
//
//  Created by Christopher Nady on 1/31/18.
//  Copyright © 2018 Nady Analytics, LLC. All rights reserved.
//

import UIKit

class UpcomingEventsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var publicJsonArray = [Any]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return publicJsonArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "EventTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? EventTableViewCell  else {
            fatalError("The dequeued cell is not an instance of EventTableViewCell.")
        }
        let event = publicJsonArray[indexPath.row]
        cell.ParticipantsLabel.text = "text"
        cell.StartTimeLabel.text = "text"
        cell.SportLabel.text = "text"
        return cell
        }
    
    
    @IBOutlet weak var UpcomingEventsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        UpcomingEventsTableView.delegate = self
        UpcomingEventsTableView.dataSource = self

        let session = URLSession.shared
        
        let eventsURL = URL(string:"https://sports-match.herokuapp.com/home.json")!
        
        let dataTask = session.dataTask(with: eventsURL) {
            (data: Data?, response: URLResponse?, error: Error?) in
            
            if let error = error {
                print("Error:\n\(error)")
            } else {
                if let data = data {
                    let json = try? JSONSerialization.jsonObject(with: data, options: [])
                    let jsonArray = json! as? Array<Any>
                    self.publicJsonArray = jsonArray!
                    print(self.publicJsonArray)
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
