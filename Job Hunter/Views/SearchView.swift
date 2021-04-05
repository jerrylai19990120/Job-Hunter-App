//
//  SearchView.swift
//  Job Hunter
//
//  Created by Jerry Lai on 2021-03-19.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI
import SlideOverCard

struct SearchView: View {
    
    var gr: GeometryProxy
    
    @State var query = ""
    
    @State var didSearch = false
    
    @State var results: [Job] = [Job(title: "Loading", company: "Loading", desc: "Loading", url: "Loading", lat: "Loading", lng: "Loading", contract: "Loading", created: "Loading", location: "Loading")]
    
    @State private var normal = CardPosition.bottom
    @State private var normalBg = BackgroundStyle.blur
    
    @State private var location = CardPosition.bottom
    @State private var locationBg = BackgroundStyle.blur
    
    var body: some View {
        
        ZStack{
            
            if didSearch {
                ResultsView(gr: gr, query: self.$query, didSearch: self.$didSearch, results: self.$results)
            } else {
                Rectangle()
                    .fill(Color(red: 244/255 , green: 245/255, blue: 249/255))
                    .edgesIgnoringSafeArea([.top, .bottom])
                
                
                VStack {
                    SearchHeader(gr: gr, query: $query, didSearch: $didSearch, results: $results, normal: $normal, location: $location)
                        .offset(y: gr.size.height/3)
                        
                    Spacer()
                }
            }
            
            SlideOverCard($normal, backgroundStyle: $normalBg) {
                NormalFilter(gr: self.gr)
            }
            
            SlideOverCard($location, backgroundStyle: $locationBg) {
                LocationFilter(gr: self.gr)
            }
            
        }.animation(.default)
        .navigationBarTitle("")
        .navigationBarHidden(true)
            
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            SearchView(gr: gr)
        }
    }
}
