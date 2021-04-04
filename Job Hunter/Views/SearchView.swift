//
//  SearchView.swift
//  Job Hunter
//
//  Created by Jerry Lai on 2021-03-19.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    
    var gr: GeometryProxy
    
    @State var query = ""
    
    @State var didSearch = false
    
    @State var results: [Job] = [Job(title: "Loading", company: "Loading", desc: "Loading", url: "Loading", lat: "Loading", lng: "Loading", contract: "Loading", created: "Loading", location: "Loading")]
    
    var body: some View {
        
        ZStack{
            
            if didSearch {
                ResultsView(gr: gr, query: self.$query, didSearch: self.$didSearch, results: self.$results)
            } else {
                Rectangle()
                    .fill(Color(red: 244/255 , green: 245/255, blue: 249/255))
                    .edgesIgnoringSafeArea([.top, .bottom])
                
                
                VStack {
                    SearchHeader(gr: gr, query: $query, didSearch: $didSearch, results: $results)
                        .offset(y: gr.size.height/3)
                        
                    Spacer()
                }
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
