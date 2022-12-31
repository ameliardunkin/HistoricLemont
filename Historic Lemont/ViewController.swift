//
//  ViewController.swift
//  Historic Lemont
//
//  Created by Amelia Dunkin on 12/26/22.
//

//Need to work through run time errors that prevent zooming
import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    @IBOutlet weak var mapView: MKMapView!
    var isFirstTime = true
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        mapView.isZoomEnabled = true
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        addAnnotations()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //MKDirections (directions)
        //MKUserLocation
        //Use var userLocation: MKUserLocation { get }
        // locationManager.didChangeValue(for: <#T##KeyPath<CLLocationManager, Value>#>) (possiblity)
        //MKPolygon (highlight tour reach)
        //MKTileOverlay (custom background)
        // I also dowloaded a file on only having the relevant locations)

        if let location = locations.last{
            if isFirstTime{
                render(location)
            }
        }
        
    }
    func addAnnotations(){
        let locations = [
            ["title": "Lemont Quarryman's Strike Mural", "latitude": 41.673467, "longitude": -88.002908 ],
            ["title": "General Fry's Landing", "latitude": 41.675681, "longitude": -87.999791]
        ]
        for location in locations{
            let annotation = MKPointAnnotation()
            annotation.title = location["title"] as? String
            annotation.coordinate = CLLocationCoordinate2D(latitude : location["latitude"] as! Double, longitude: location["longitude"] as! Double)
            mapView.addAnnotation(annotation)
        }
        mapView.showsUserLocation = true
    }
    func render(_ location: CLLocation ){
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
        isFirstTime = false
        
    }

}

