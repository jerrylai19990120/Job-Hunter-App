//
//  JobItem.swift
//  Job Hunter
//
//  Created by Jerry Lai on 2021-03-19.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct JobItem: View {
    
    var gr: GeometryProxy
    
    var job: Job = Job(title: "Loading", company: "Loading", desc: "Loading", url: "Loading", lat: "Loading", lng: "Loading", contract: "Loading", created: "Loading", location: "Loading")
    
    @State var isBookMarked = false
    
    var body: some View {
        HStack {
            VStack {
                Image("google")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: gr.size.width*0.1, height: gr.size.width*0.1)
                
                Spacer()
            }
            
            
            VStack(alignment: .leading) {
                Text(job.company)
                    .foregroundColor(.gray)
                    .font(.system(size: gr.size.width*0.036, weight: .medium, design: .default))
                
                Text(job.title)
                    .font(.system(size: gr.size.width*0.05, weight: .medium, design: .default))
                
                Text(job.location)
                    .foregroundColor(.gray)
                    .font(.system(size: gr.size.width*0.036, weight: .medium, design: .default))
                
                Spacer()
            }
            Spacer()
            VStack {
                //Spacer()
                Image(systemName: isBookMarked ? "bookmark.fill" : "bookmark")
                    .foregroundColor(.gray)
                    .font(.system(size: gr.size.width*0.036, weight: .medium, design: .default))
                
                Spacer()
                
                Text(job.created)
                    .font(.system(size: gr.size.width*0.036, weight: .medium, design: .default))
                    .foregroundColor(.gray)
                Spacer()
            }
        }.frame(width: gr.size.width*0.88, height: gr.size.height*0.08)
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 3)
    }
}

struct JobItem_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            JobItem(gr: gr)
        }
    }
}
