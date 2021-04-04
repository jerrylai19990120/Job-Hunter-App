//
//  BookmarkView.swift
//  Job Hunter
//
//  Created by Jerry Lai on 2021-03-19.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct BookmarkView: View {
    
    var gr: GeometryProxy
    
    @State var bookMarkedJobs = [Job]()
    
    var body: some View {
        VStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("primaryPurple"), Color("secondaryPurple")]), startPoint: .trailing, endPoint: .leading)
                
                HStack {
                    Spacer()
                    Text("Bookmark")
                        .foregroundColor(.white)
                        .font(.system(size: gr.size.width*0.06, weight: .semibold, design: .default))
                        .padding()
                    Spacer()
                }.offset(y: gr.size.height*0.02)
            }.edgesIgnoringSafeArea(.top)
            .frame(height: gr.size.height*0.06)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(self.bookMarkedJobs, id: \.self){
                        job in
                        NavigationLink(destination: JobDetailView(gr: self.gr, job: job).navigationBarItems(trailing: ShareButton(gr: self.gr))) {
                            JobItem(gr: self.gr, job: job,isBookMarked: true, jobs: self.$bookMarkedJobs)
                                .padding(.bottom)
                        }.accentColor(.black)
                        
                    }
                    
                }.padding()
                .frame(width: gr.size.width)
            }.frame(width: gr.size.width)
            
            
            
            
            Spacer()
        }.navigationBarTitle("")
        .navigationBarHidden(true)
        .onAppear {
            self.bookMarkedJobs = DataService.instance.loadJob()
        }
    }
}

struct BookmarkView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            BookmarkView(gr: gr)
        }
    }
}
