//
//  FirstViewController.swift
//  KatyHikingTrails
//
//  Created by Christopher Nady on 2/13/18.
//  Copyright © 2018 Nady Analytics, LLC. All rights reserved.
//

import UIKit

class AllTrailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var AllTrailsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AllTrailsTableView.delegate = self
        AllTrailsTableView.dataSource = self
        
        let session = URLSession.shared
        let eventsURL = URL(string:"https://katy-hiking-trails.herokuapp.com/trails.json")!
        let dataTask = session.dataTask(with: eventsURL) {
            (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                print("Error:\n\(error)")
            } else {
                if let data = data {
                    DispatchQueue.main.async {
                        let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
                        self.publicJsonArray = json!!
                        for object in self.publicJsonArray {
                            print(object)
                        }
                        self.AllTrailsTableView.reloadData()
                    }
                } else {
                    print("Error: did not receive data")
                }
            }
        }
        dataTask.resume()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var publicJsonArray = [[String: Any]]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return publicJsonArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "TrailTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TrailTableViewCell  else {
            fatalError("The dequeued cell is not an instance of TrailTableViewCell.")
        }
        cell.TrailNameLabel.text = publicJsonArray[indexPath.row]["name"] as? String
        return cell
    }


}

