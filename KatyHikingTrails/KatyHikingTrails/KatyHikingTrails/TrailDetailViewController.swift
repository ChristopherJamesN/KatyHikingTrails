//
//  TrailDetailViewController.swift
//  KatyHikingTrails
//
//  Created by Christopher Nady on 2/16/18.
//  Copyright © 2018 Nady Analytics, LLC. All rights reserved.
//

import UIKit
import WebKit

class TrailDetailViewController: UIViewController {

    @IBOutlet weak var TrailNameLabel: UILabel!
    @IBOutlet weak var TrailDescriptionTextView: UITextView!
    @IBOutlet var GoogleMapWebView: WKWebView!
    var Name = ""
    var MapLink = ""
    var Description = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        TrailNameLabel.text = self.Name
        TrailDescriptionTextView.text = self.Description
        let url = NSURL (string: self.MapLink);
        let requestObj = NSURLRequest(url: url! as URL);
        GoogleMapWebView.load(requestObj as URLRequest);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
