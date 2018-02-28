//
//  TrailDetailViewController.swift
//  KatyHikingTrails
//
//  Created by Christopher Nady on 2/16/18.
//  Copyright © 2018 Nady Analytics, LLC. All rights reserved.
//

import UIKit
import MapKit

class TrailDetailViewController: UIViewController, MKMapViewDelegate{

    @IBOutlet weak var TrailNameLabel: UILabel!
    @IBOutlet weak var TrailDescriptionTextView: UITextView!
    @IBOutlet weak var MapView: MKMapView!
    @IBOutlet weak var TrailDirectionsTextView: UITextView!
    
    
    var Name = ""
    var MapLink = ""
    var Description = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TrailNameLabel.text = self.Name
        TrailDescriptionTextView.text = self.Description
        TrailDescriptionTextView.isEditable = false
        TrailDirectionsTextView.isEditable = false
        
        MapView.delegate = self
        MapView.mapType = .standard
        MapView.showsUserLocation = true
        MapView.showsScale = true
        MapView.showsCompass = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        var latitude = "29"
        var longitude = "-96"
        
        if self.MapLink == "No maplink available." {
            latitude = "25"
            longitude = "-96"
        } else {
            var myStringArr = self.MapLink.components(separatedBy:  ",")
            latitude = String(myStringArr[2].suffix(10))
            if latitude.first == "@" {
                latitude.remove(at: latitude.startIndex)
            }
            longitude = myStringArr[3]
        }
        let DestinationLocation = CLLocationCoordinate2D(latitude: Double(latitude)!, longitude: Double(longitude)!)
        
        let request = MKDirectionsRequest()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: MapView.userLocation.coordinate, addressDictionary: nil))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: DestinationLocation, addressDictionary: nil))
        request.requestsAlternateRoutes = false
        request.transportType = .automobile
        
        let directions = MKDirections(request: request)
        
        directions.calculate { [unowned self] response, error in
            guard let unwrappedResponse = response else { self.setNeedsFocusUpdate(); return; }
            
            for route in unwrappedResponse.routes {
                self.MapView.add(route.polyline)
                self.MapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
                for step in route.steps {
                    print(step.instructions)
                    self.TrailDirectionsTextView.text.append("\n" + step.instructions)
                }
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(polyline: overlay as! MKPolyline)
        renderer.strokeColor = UIColor.blue
        renderer.fillColor = UIColor.red
        renderer.lineWidth = 2
        return renderer
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
