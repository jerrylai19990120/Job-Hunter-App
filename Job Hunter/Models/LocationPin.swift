//
//  LocationPin.swift
//  Job Hunter
//
//  Created by Jerry Lai on 2021-04-03.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import Foundation
import MapKit

class LocationPin: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    
    init(_ coord: CLLocationCoordinate2D) {
        self.coordinate = coord
    }
    
}
