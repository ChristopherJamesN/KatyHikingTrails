//
//  CreateMatchViewController.swift
//  SportsMatchMobile
//
//  Created by Christopher Nady on 1/31/18.
//  Copyright © 2018 Nady Analytics, LLC. All rights reserved.
//

import UIKit

class CreateMatchViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    private let myValues: NSArray = ["defeat", "lose to"]
    private let mySports: NSArray = ["NBA", "NFL", "MLB", "NHL", "PGA"]
    private let myEvents: NSArray = ["Rockets vs Nuggets", "Cavaliers vs Warriors", "Spurs vs Raptors"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == OutcomePickerView {
            return myValues.count
        } else if pickerView == SportPickerView {
            return mySports.count
        } else {
            return myEvents.count
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == OutcomePickerView {
            return myValues[row] as? String
        } else if pickerView == SportPickerView {
            return mySports[row] as? String
        } else {
            return myEvents[row] as? String
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == OutcomePickerView {
            print("row: \(row)")
            print("value: \(myValues[row])")
        } else if pickerView == SportPickerView {
            print("row: \(row)")
            print("value: \(mySports[row])")
        } else {
            print("row: \(row)")
            print("value: \(myEvents[row])")
            let teams = myEvents[row] as? String
            let teamsArr = teams?.components(separatedBy: "vs")
            Team1Label.text = teamsArr![0]
            Team2Label.text = teamsArr![1]
        }
    }
    
    
    @IBOutlet weak var SportPickerView: UIPickerView!
    @IBOutlet weak var EventPickerView: UIPickerView!
    @IBOutlet weak var Team1Label: UILabel!
    @IBOutlet weak var OutcomePickerView: UIPickerView!
    @IBOutlet weak var Team2Label: UILabel!
    @IBOutlet weak var ChanceTextField: UITextField!
    @IBOutlet weak var PointsTextField: UITextField!
    @IBAction func CreateMatchButton(_ sender: Any) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        OutcomePickerView.dataSource = self
        OutcomePickerView.delegate = self
        
        SportPickerView.dataSource = self
        SportPickerView.delegate = self
        
        EventPickerView.dataSource = self
        EventPickerView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
