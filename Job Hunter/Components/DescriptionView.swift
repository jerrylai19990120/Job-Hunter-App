//
//  DescriptionView.swift
//  Job Hunter
//
//  Created by Jerry Lai on 2021-03-21.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct DescriptionView: View {
    
    var gr: GeometryProxy
    
    var job: Job = Job(title: "Loading", company: "Loading", desc: "Loading", url: "Loading", lat: "Loading", lng: "Loading", contract: "Loading", created: "Loading", location: "Loading")
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                Text("\(job.desc)")
                    .foregroundColor(.gray)
                    .font(.system(size: gr.size.width*0.04, weight: .medium, design: .default))
                    .padding()
                    .lineSpacing(5)
            }.padding(.bottom, gr.size.height*0.4)
        }
        
        
            
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            DescriptionView(gr: gr)
        }
    }
}
