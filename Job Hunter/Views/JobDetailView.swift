//
//  JobDetailView.swift
//  Job Hunter
//
//  Created by Jerry Lai on 2021-03-21.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct JobDetailView: View {
    
    var gr: GeometryProxy
    
    @State var selection = 0
    
    var body: some View {
        VStack {
            Image("google")
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: gr.size.width*0.2, height: gr.size.width*0.2)
                .cornerRadius(10)
                .shadow(radius: 6)
            
            Text("Sr. UI Designer")
                .font(.system(size: gr.size.width*0.07, weight: .medium, design: .default))
            
            Text("Google, New York")
                .foregroundColor(.gray)
                .font(.system(size: gr.size.width*0.038, weight: .medium, design: .default))
            
            Text("$45k-$60k/yr")
                .foregroundColor(Color(red: 117/255, green: 122/255, blue: 143/255))
                .font(.system(size: gr.size.width*0.04, weight: .medium, design: .default))
            
            HStack {
                Text("Description")
                    .foregroundColor(selection==0 ? .black : .gray)
                    .font(.system(size: gr.size.width*0.042, weight: .medium, design: .default))
                    
                
                Text("Company")
                    .foregroundColor(selection==1 ? .black : .gray)
                    .font(.system(size: gr.size.width*0.042, weight: .medium, design: .default))
                
                Text("Reviews")
                    .foregroundColor(selection==2 ? .black : .gray)
                    .font(.system(size: gr.size.width*0.042, weight: .medium, design: .default))
                
            }.padding()
            .frame(width: gr.size.width*0.9)
            
            
        }.padding()
        .frame(width: gr.size.width)
    }
}

struct JobDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            JobDetailView(gr: gr)
        }
    }
}
