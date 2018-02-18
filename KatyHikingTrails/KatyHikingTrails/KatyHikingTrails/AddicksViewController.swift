//
//  SecondViewController.swift
//  KatyHikingTrails
//
//  Created by Christopher Nady on 2/13/18.
//  Copyright © 2018 Nady Analytics, LLC. All rights reserved.
//

import UIKit

class AddicksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var AddicksTrailsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AddicksTrailsTableView.delegate = self
        AddicksTrailsTableView.dataSource = self
        
        let session = URLSession.shared
        let eventsURL = URL(string:"https://katy-hiking-trails.herokuapp.com/trails/addicks.json")!
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
                        self.AddicksTrailsTableView.reloadData()
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
        cell.AddicksTrailNameLabel.text = publicJsonArray[indexPath.row]["name"] as? String
        cell.AddicksTrailsDescriptionLabel.text = publicJsonArray[indexPath.row]["description"] as? String
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let newTrailDetailViewController = segue.destination as? TrailDetailViewController else {
            fatalError("Unexpected destination: \(segue.destination)")
        }
        
        guard let selectedTrailCell = sender as? TrailTableViewCell else {
            fatalError("Unexpected sender: \(sender ?? "Nothing")")
        }
        
        guard let indexPath = AddicksTrailsTableView.indexPath(for: selectedTrailCell) else {
            fatalError("The selected cell is not being displayed by the table")
        }
        
        let selectedName = publicJsonArray[indexPath.row]["name"] as? String
        newTrailDetailViewController.Name = selectedName!
        var selectedDescription = "No description available."
        var selectedMaplink = "No maplink available."
        if (publicJsonArray[indexPath.row]["description"]) != nil && ((publicJsonArray[indexPath.row]["description"]! as? String) != nil) {
            selectedDescription = ((publicJsonArray[indexPath.row]["description"] as? String))!
        }
        newTrailDetailViewController.Description = selectedDescription
        if (publicJsonArray[indexPath.row]["maplink"]) != nil && ((publicJsonArray[indexPath.row]["maplink"]! as? String) != nil) {
            selectedMaplink = ((publicJsonArray[indexPath.row]["maplink"] as? String))!
        }
        newTrailDetailViewController.MapLink = selectedMaplink
    }


}

