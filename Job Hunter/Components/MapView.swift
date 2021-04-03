//
//  ReviewView.swift
//  Job Hunter
//
//  Created by Jerry Lai on 2021-03-21.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    var gr: GeometryProxy
    
    var job: Job = Job(title: "Loading", company: "Loading", desc: "Loading", url: "Loading", lat: "0", lng: "0", contract: "Loading", created: "Loading", location: "Loading")
    
    @State var coord = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    
    var body: some View {
        VStack {
            UIMap(coordinate: coord)
                .frame(height: gr.size.height*0.28)
            
            Spacer()
        }.padding()
        .onAppear {
            self.coord.latitude = CLLocationDegrees(exactly: Double(self.job.lat) ?? 0)!
            self.coord.longitude = CLLocationDegrees(exactly: Double(self.job.lng) ?? 0)!
        }
        
        
    }
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            MapView(gr: gr)
        }
    }
}
