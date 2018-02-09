//
//  CreateMatchViewController.swift
//  SportsMatchMobile
//
//  Created by Christopher Nady on 1/31/18.
//  Copyright © 2018 Nady Analytics, LLC. All rights reserved.
//

import UIKit

class CreateMatchViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
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
    private let myValues: NSArray = ["defeat", "lose to"]
    override func viewDidLoad() {
        super.viewDidLoad()
        OutcomePickerView.dataSource = self
        OutcomePickerView.delegate = self
    }
    
    func numberOfComponentsInPickerView(OutcomePickerView: UIPickerView) -> Int {
        return 1
    }
    
    // data method to return the number of row shown in the picker.
    func pickerView(_ OutcomePickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myValues.count
    }
    
    // delegate method to return the value shown in the picker
    func pickerView(OutcomePickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myValues[row] as? String
    }
    
    // delegate method called when the row was selected.
    func pickerView(OutcomePickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("row: \(row)")
        print("value: \(myValues[row])")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
