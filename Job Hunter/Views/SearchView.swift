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
    
    var body: some View {
        
        ZStack{
            
            if(query != ""){
                ResultsView(gr: gr, query: self.$query)
            } else {
                Rectangle()
                    .fill(Color(red: 244/255 , green: 245/255, blue: 249/255))
                    .edgesIgnoringSafeArea([.top, .bottom])
                
                
                VStack {
                    SearchHeader(gr: gr, query: $query)
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
