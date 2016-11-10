//
//  ViewController.swift
//  Map Demo
//
//  Created by Shikha Gupta on 10/11/16.
//  Copyright © 2016 shikha. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate {
    
    @IBOutlet weak var map: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        
        let latitute : CLLocationDegrees = 12.97
        
        let longitute : CLLocationDegrees = 77.59
        
        let latDelta :CLLocationDegrees = 0.01
        
        let longDelta :CLLocationDegrees = 0.01
        
        let span : MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        
        let loaction : CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitute, longitute)
        
        
        let region : MKCoordinateRegion = MKCoordinateRegionMake(loaction, span)
        
        
        map.setRegion(region, animated: true)
        
        
        let anotation = MKPointAnnotation()
        
        anotation.coordinate = loaction
        anotation.title = "Bangalore"
        anotation.subtitle = "Sub titile goes here"
        
        map.addAnnotation(anotation)
        
        
        
        let longPress = UILongPressGestureRecognizer(target: self, action: "action:")
        
        longPress.minimumPressDuration = 2
        
        map.addGestureRecognizer(longPress)
        
    }
    
    func action(gestureRecognizer: UIGestureRecognizer)
    {
        print("Gesture recoginized!!!")
        let touchPoint = gestureRecognizer.locationInView(self.map)
        
        let newCoordinate : CLLocationCoordinate2D = map.convertPoint(touchPoint, toCoordinateFromView: self.map)
        
        let anotation = MKPointAnnotation()
        
        anotation.coordinate = newCoordinate
        anotation.title = "new place"
        anotation.subtitle = "Sub titile 1 goes here"
        
        map.addAnnotation(anotation)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        
        let userLocation : CLLocation = locations[0]
        
        let latitute = userLocation.coordinate.latitude
        
        let longitute = userLocation.coordinate.longitude
        
        let latSpan = 0.05
        
        let longSpan = 0.05
        
        let span : MKCoordinateSpan = MKCoordinateSpanMake(latSpan, longSpan)
        
        let location : CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitute, longitute)
        
        let region : MKCoordinateRegion = MKCoordinateRegionMake(location, span)
    
        self.map.setRegion(region, animated: true)
    }
    
    
}

