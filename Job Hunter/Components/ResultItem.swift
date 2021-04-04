//
//  ResultItem.swift
//  Job Hunter
//
//  Created by Jerry Lai on 2021-03-31.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct ResultItem: View {
    
    var gr: GeometryProxy
    
    var job: Job = Job(title: "Loading", company: "Loading", desc: "Loading", url: "Loading", lat: "Loading", lng: "Loading", contract: "Loading", created: "Loading", location: "Loading")
    
    @State var isBookMarked = false
    
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(red: 92/255, green: 107/255, blue: 192/255))
                        .frame(width: gr.size.width*0.1, height: gr.size.width*0.1)
                    
                    Text("\(String(job.company.prefix(1)))")
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                }
                
                VStack(alignment: .leading) {
                    Text(job.title)
                        .font(.system(size: gr.size.width*0.054, weight: .medium, design: .default))
                    Text(job.company)
                        .font(.system(size: gr.size.width*0.04, weight: .regular, design: .default))
                    
                    Text(job.location)
                        .foregroundColor(.gray)
                        .font(.system(size: gr.size.width*0.04, weight: .regular, design: .default))
                }
                Spacer()
                
                Image(systemName: isBookMarked ? "bookmark.fill" : "bookmark")
                    .foregroundColor(.gray)
                    .font(.system(size: gr.size.width*0.04, weight: .medium, design: .default))
                    .onTapGesture {
                        self.isBookMarked.toggle()
                        if self.isBookMarked{
                            var arr = DataService.instance.loadJob()
                            arr.append(self.job)
                            DataService.instance.saveJob(arr)
                        }else{
                            
                        }
                    }
            }
            Divider()
        }.padding()
        
    }
}

struct ResultItem_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            ResultItem(gr: gr)
        }
    }
}
