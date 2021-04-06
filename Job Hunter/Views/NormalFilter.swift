//
//  NormalFilter.swift
//  Job Hunter
//
//  Created by Jerry Lai on 2021-04-05.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI
import SlideOverCard

struct NormalFilter: View {
    
    var gr: GeometryProxy
    
    @Binding var contract: String
    
    @Binding var position: CardPosition
    
    var body: some View {
        
            VStack {
                Button(action: {
                    self.contract = "full_time"
                    self.position = CardPosition.bottom
                }) {
                    Text("Full Time")
                        .font(.system(size: gr.size.width*0.046, weight: .regular, design: .default))
                        .padding()
                    .frame(width: gr.size.width)
                }.accentColor(.black)
                
                
                Divider()
                
                Button(action: {
                    self.contract = "part_time"
                    self.position = CardPosition.bottom
                }) {
                    
                    Text("Part Time")
                        .font(.system(size: gr.size.width*0.046, weight: .regular, design: .default))
                        .padding()
                    .frame(width: gr.size.width)
                }.accentColor(.black)
                
                
                Divider()
                
                Button(action: {
                    self.contract = "contract"
                    self.position = CardPosition.bottom
                }) {
                    Text("Contract")
                        .font(.system(size: gr.size.width*0.046, weight: .regular, design: .default))
                        .padding()
                    .frame(width: gr.size.width)
                }.accentColor(.black)
                
                
                Divider()
                
                Button(action: {
                    self.contract = "permanent"
                    self.position = CardPosition.bottom
                }) {
                    Text("Permanent")
                        .font(.system(size: gr.size.width*0.046, weight: .regular, design: .default))
                        .padding()
                    .frame(width: gr.size.width)
                }.accentColor(.black)
                
                                    
            }

    }
}

struct NormalFilter_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            NormalFilter(gr: gr, contract: .constant(""), position: .constant(CardPosition.top))
        }
    }
}
