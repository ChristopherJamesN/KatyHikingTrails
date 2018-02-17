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
        TrailDescriptionTextView.isEditable = false
        let url = NSURL (string: self.MapLink);
        if url != nil{
            let requestObj = NSURLRequest(url: url! as URL);
            GoogleMapWebView.load(requestObj as URLRequest);
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
