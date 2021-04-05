//
//  HomeViewBanner.swift
//  Job Hunter
//
//  Created by Jerry Lai on 2021-03-20.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI
import SlideOverCard

struct HomeViewBanner: View {
    
    var gr: GeometryProxy
    
    @Binding var slideup: CardPosition
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Rectangle()
                    .fill(Color(red: 148/255, green: 101/255, blue: 251/255))
                    .frame(height: gr.size.height*0.4*0.4)
                Rectangle()
                    .fill(Color.white)
                    .frame(height: gr.size.height*0.4*0.6)
            }
            
            VStack(spacing: 0) {
                HStack {
                    
                    Image("work")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                    
                    Image("work2")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                    
                    Image("work3")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                    
                }.frame(height: gr.size.height*0.4*0.4)
                
                VStack(alignment: .leading) {
                    Text("How to Prepare for Your Interview")
                        .font(.system(size: gr.size.width*0.05, weight: .medium, design: .default))
                        .padding([.leading, .trailing])
                        .padding(.bottom, 5)
                    
                    Text("Even the smartest and most qualified job seekers need to prepare for job interviews.")
                        .font(.system(size: gr.size.width*0.04, weight: .medium, design: .default))
                        .foregroundColor(.gray)
                        .padding([.bottom, .leading, .trailing])
                    
                    HStack {
                        Spacer()
                        
                        Text("Interview Tips")
                            .padding()
                            .frame(width: gr.size.width*0.9)
                            .foregroundColor(Color("secondaryPurple"))
                            .background(Color(red: 223/255, green: 218/255, blue: 254/255))
                            .cornerRadius(16)
            
                        Spacer()
                    }.padding(.bottom)
                    .onTapGesture {
                        self.slideup = CardPosition.top
                    }
                    
                }//.padding()
                .frame(width: gr.size.width*0.96, height: gr.size.height*0.4*0.6)
                
            }
        }.frame(width: gr.size.width*0.96, height: gr.size.height*0.38)
        .cornerRadius(16)
        .shadow(radius: 3)
    }
}

struct HomeViewBanner_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            HomeViewBanner(gr: gr, slideup: .constant(CardPosition.top))
        }
    }
}
