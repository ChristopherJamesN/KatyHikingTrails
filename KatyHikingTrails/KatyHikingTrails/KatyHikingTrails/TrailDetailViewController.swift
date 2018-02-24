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

class TrailDetailViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var TrailNameLabel: UILabel!
    @IBOutlet weak var TrailDescriptionTextView: UITextView!
    @IBOutlet weak var MapView: MKMapView!
    @IBOutlet weak var TrailDirectionsTextView: UITextView!
    let locationManager = CLLocationManager()
    
    var Name = ""
    var MapLink = ""
    var Description = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        TrailNameLabel.text = self.Name
        TrailDescriptionTextView.text = self.Description
        TrailDescriptionTextView.isEditable = false
        TrailDirectionsTextView.isEditable = false
        
        locationManager.requestWhenInUseAuthorization()
        
        var latitude = "29"
        var longitude = "-96"
        
        if self.MapLink == "No maplink available." {
            latitude = "25"
            longitude = "-96"
        } else {
            var myStringArr = self.MapLink.components(separatedBy:  ",")
            latitude = String(myStringArr[2].suffix(10))
            longitude = myStringArr[3]
        }
        let DestinationLocation = CLLocationCoordinate2D(latitude: Double(latitude)!, longitude: Double(longitude)!)
        
        MapView.delegate = self
        MapView.mapType = .standard
        MapView.showsUserLocation = true
        MapView.showsScale = true
        MapView.showsCompass = true
        
        let request = MKDirectionsRequest()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: MapView.userLocation.coordinate, addressDictionary: nil))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: DestinationLocation, addressDictionary: nil))
        request.requestsAlternateRoutes = true
        request.transportType = .automobile
        
        let directions = MKDirections(request: request)
        
        directions.calculate { [unowned self] response, error in
            guard let unwrappedResponse = response else { return }
            
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
        return renderer
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
