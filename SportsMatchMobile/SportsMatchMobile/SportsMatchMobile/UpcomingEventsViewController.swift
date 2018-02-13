//
//  UpcomingEventsViewController.swift
//  SportsMatchMobile
//
//  Created by Christopher Nady on 1/31/18.
//  Copyright © 2018 Nady Analytics, LLC. All rights reserved.
//

import UIKit

class UpcomingEventsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
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
                    DispatchQueue.main.async {
                        let json = try? JSONSerialization.jsonObject(with: data, options: [])
                        var jsonArray = String()
                        if let json = String(data: data, encoding: .utf8) {
                            print(json)
                            jsonArray = json
                        }
                        self.publicJsonArray += jsonArray
                        print(self.publicJsonArray)
                        self.UpcomingEventsTableView.reloadData()
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
    
    var publicJsonArray = String()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return publicJsonArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "EventTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? EventTableViewCell  else {
            fatalError("The dequeued cell is not an instance of EventTableViewCell.")
        }
        cell.ParticipantsLabel.text = publicJsonArray
        cell.StartTimeLabel.text = publicJsonArray
        cell.SportLabel.text = "text"
        return cell
    }
    
}
