//
//  UIMap.swift
//  Job Hunter
//
//  Created by Jerry Lai on 2021-04-03.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import Foundation
import SwiftUI
import MapKit

class Coordinator: NSObject, MKMapViewDelegate {
    
    var control: UIMap
    
    init(_ control: UIMap) {
        self.control = control
    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        if let annotationView = views.first {
            if let annotation = annotationView.annotation {
                let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 6000, longitudinalMeters: 6000)
                mapView.setRegion(region, animated: true)
            }
        }
        
    }
    
}


struct UIMap: UIViewRepresentable {
    
    let coordinate: CLLocationCoordinate2D
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.delegate = context.coordinator
        return map
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.removeAnnotations(uiView.annotations)
        uiView.addAnnotation(LocationPin(coordinate))
    }
    
}
