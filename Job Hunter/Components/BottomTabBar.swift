//
//  BottomTabBar.swift
//  Job Hunter
//
//  Created by Jerry Lai on 2021-03-19.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct BottomTabBar: View {
    
    var gr: GeometryProxy
    
    @Binding var selection: Int
    
    @Binding var popup: Bool
    
    var body: some View {
        
        
            
            HStack {
                Spacer()
                Button(action: {
                    self.selection = 0
                    self.popup = false
                }) {
                    Image(systemName: selection==0 ? "house.fill" : "house")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: gr.size.width*0.06, height: gr.size.width*0.06)
                        .foregroundColor(selection==0 ? Color("darkGrey") : Color("lightPurple"))
                        .font(.system(size: gr.size.width*0.06, weight: .bold, design: .rounded))
                        
                }.frame(width: gr.size.width*0.33, height: gr.size.height*0.1)
                
                
                Button(action: {
                    self.selection = 1
                    self.popup = true
                }) {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: gr.size.width*0.06, height: gr.size.width*0.06)
                        .foregroundColor(selection==1 ? Color("darkGrey") : Color("lightPurple"))
                        .font(.system(size: gr.size.width*0.06, weight: .bold, design: .rounded))
                }.frame(width: gr.size.width*0.33, height: gr.size.height*0.1)
                
                
                Button(action: {
                    self.selection = 2
                    self.popup = false
                }) {
                    Image(systemName: selection==2 ? "bookmark.fill" : "bookmark")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: gr.size.width*0.06, height: gr.size.width*0.06)
                        .foregroundColor(selection==2 ? Color("darkGrey") : Color("lightPurple"))
                        .font(.system(size: gr.size.width*0.06, weight: .bold, design: .rounded))
                }.frame(width: gr.size.width*0.33, height: gr.size.height*0.1)
                    
                
                
                    
                
                Spacer()
                
            }.frame(width: gr.size.width, height: gr.size.height*0.1)
                .animation(.default)
                .background(Color.white)
            //hstack
    }
}

struct BottomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            BottomTabBar(gr: gr, selection: .constant(0), popup: .constant(false))
        }
    }
}
