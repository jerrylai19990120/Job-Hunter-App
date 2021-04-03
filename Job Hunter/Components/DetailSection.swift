//
//  DetailSection.swift
//  Job Hunter
//
//  Created by Jerry Lai on 2021-03-21.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct DetailSection: View {
    
    var gr: GeometryProxy
    
    var job: Job = Job(title: "Loading", company: "Loading", desc: "Loading", url: "Loading", lat: "Loading", lng: "Loading", contract: "Loading", created: "Loading", location: "Loading")
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                
                HStack {
                    Text("Job details")
                        .font(.system(size: gr.size.width*0.045, weight: .medium, design: .default))
                    Spacer()
                }.padding([.leading, .top])
               
                
                HStack{
                    VStack(alignment: .leading) {
                        Text("The Company")
                            .font(.system(size: gr.size.width*0.04, weight: .medium, design: .default))
                            .padding(.top)
                        
                        Text(job.company)
                            .foregroundColor(.gray)
                            .font(.system(size: gr.size.width*0.04, weight: .regular, design: .default))
                    }
                    Spacer()
                }.padding(.leading)
                
                
                
                HStack{
                    VStack(alignment: .leading) {
                        Text("Job Function")
                            .font(.system(size: gr.size.width*0.04, weight: .medium, design: .default))
                            .padding(.top)
                        
                        Text(job.title)
                            .foregroundColor(.gray)
                            .font(.system(size: gr.size.width*0.04, weight: .regular, design: .default))
                    }

                    Spacer()
                }.padding(.leading)
                
                
                
                HStack{
                    VStack(alignment: .leading) {
                        Text("Location")
                            .font(.system(size: gr.size.width*0.04, weight: .medium, design: .default))
                            .padding(.top)
                        
                        Text(job.location)
                            .foregroundColor(.gray)
                            .font(.system(size: gr.size.width*0.04, weight: .regular, design: .default))
                    }
                    Spacer()
                }.padding(.leading)
                
                
                
                HStack{
                    VStack(alignment: .leading) {
                        Text("Employment")
                            .font(.system(size: gr.size.width*0.04, weight: .medium, design: .default))
                            .padding(.top)
                        Text(job.contract)
                            .foregroundColor(.gray)
                            .font(.system(size: gr.size.width*0.04, weight: .regular, design: .default))
                    }
                    Spacer()
                }.padding(.leading)
                
                
                
                HStack{
                    Text(job.created)
                        .foregroundColor(.gray)
                        .font(.system(size: gr.size.width*0.04, weight: .regular, design: .default))
                        .padding(.top)
                    Spacer()
                }.padding(.leading)
                
                
                Spacer()
                
            }.frame(width: gr.size.width)
            .padding(.bottom, gr.size.height*0.4)
            
        }
        
    }
}

struct CompanyView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            DetailSection(gr: gr)
        }
        
    }
}
