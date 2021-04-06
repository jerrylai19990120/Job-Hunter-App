//
//  LocationFilter.swift
//  Job Hunter
//
//  Created by Jerry Lai on 2021-04-05.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI
import SlideOverCard

struct LocationFilter: View {
    
    var gr: GeometryProxy
    
    @Binding var locationLimit: String
    
    @Binding var position: CardPosition
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter location", text: self.$locationLimit, onCommit: {
                    self.position = CardPosition.bottom
                })
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: gr.size.width*0.06, height: gr.size.width*0.06)
            }.padding()
            .background(Color("lightPurple"))
            .cornerRadius(16)
        }.padding()
        
    }
}

struct LocationFilter_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            LocationFilter(gr: gr, locationLimit: .constant(""), position: .constant(CardPosition.top))
        }
    }
}
