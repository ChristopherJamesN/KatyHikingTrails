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

class TrailDetailViewController: UIViewController, MKMapViewDelegate {

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
        
        MapView.delegate = self
        MapView.mapType = .standard
        MapView.showsUserLocation = true
        MapView.showsScale = true
        MapView.showsCompass = true
        locationManager.requestWhenInUseAuthorization()
        let InitialLocation = CLLocationCoordinate2D(latitude: 29.7491301, longitude: -95.7142318)
        
        let request = MKDirectionsRequest()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: MapView.userLocation.coordinate, addressDictionary: nil))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: InitialLocation, addressDictionary: nil))
        request.requestsAlternateRoutes = true
        request.transportType = .automobile
        
        let directions = MKDirections(request: request)
        
        directions.calculate { [unowned self] response, error in
            guard let unwrappedResponse = response else { return }
            
            for route in unwrappedResponse.routes {
                self.MapView.add(route.polyline)
                self.MapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
            }
        }
    }
    
    func mapView(_ MapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        MapView.setCenter(userLocation.coordinate, animated: true)
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
