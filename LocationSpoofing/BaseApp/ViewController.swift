//
//  ViewController.swift
//  BaseApp
//
//  Created by Kenneth Poon on 28/11/16.
//  Copyright © 2016 Kenneth Poon. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet var mapView: MKMapView?

    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        mapView?.setUserTrackingMode(.follow, animated: true)

        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}

extension ViewController: MKMapViewDelegate {

    public func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {}
    
    public func mapView(_ mapView: MKMapView, didFailToLocateUserWithError error: Error) {}

}

extension ViewController: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let aLocation = locations.last {
            debugPrint("location: \(aLocation.coordinate)")
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        debugPrint("status: \(status)")
    }


    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {}
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        debugPrint("error: \(error)")
    }

}
