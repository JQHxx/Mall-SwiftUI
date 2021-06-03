//
//  Map.swift
//  SwiftUIKit
//
//  Created by OFweek01 on 2021/6/3.
//

import UIKit
import SwiftUI
import MapKit

struct Map: UIViewRepresentable {
    
    var locationManager:CLLocationManager = CLLocationManager()
    
    func setupManager(){
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
    }
    
    func makeUIView(context: Context) -> MKMapView {
        
        self.setupManager()
       
        let map = MKMapView(frame: UIScreen.main.bounds)
        map.showsUserLocation = true
        map.userTrackingMode = .followWithHeading
        return map
        
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
}

//struct ContentView : View {
//    
//    var body: some View {
//        Map()
//    }
//}
