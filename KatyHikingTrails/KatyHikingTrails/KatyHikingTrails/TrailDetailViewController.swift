//
//  TrailDetailViewController.swift
//  KatyHikingTrails
//
//  Created by Christopher Nady on 2/16/18.
//  Copyright © 2018 Nady Analytics, LLC. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class TrailDetailViewController: UIViewController {

    @IBOutlet weak var TrailNameLabel: UILabel!
    @IBOutlet weak var TrailDescriptionTextView: UITextView!
    @IBOutlet weak var MapView: MKMapView!
    var locationManager = CLLocationManager.init()
    
    var Name = ""
    var MapLink = ""
    var Description = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        TrailNameLabel.text = self.Name
        TrailDescriptionTextView.text = self.Description
        TrailDescriptionTextView.isEditable = false
    
        MapView.mapType = .standard
        MapView.showsUserLocation = true
        MapView.showsScale = true
        MapView.showsCompass = true
        locationManager.requestWhenInUseAuthorization()
        
        let url = NSURL (string: self.MapLink);
        if url != nil{
            let requestObj = NSURLRequest(url: url! as URL);
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
