//
//  ResultsView.swift
//  Job Hunter
//
//  Created by Jerry Lai on 2021-03-30.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct ResultsView: View {
    
    var gr: GeometryProxy
    
    @Binding var query: String
    
    @Binding var didSearch: Bool
    
    @Binding var results: [Job]
    
    var body: some View {
        
        VStack {
            
            HStack{
                NavigationLink(destination: TabNavView(selection: 0).navigationBarTitle("").navigationBarHidden(true), label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: gr.size.width*0.06, height: gr.size.width*0.06)
                        
                }).accentColor(.black)
                
                
                HStack {
                    Image(systemName: "magnifyingglass")
                    
                    TextField("\(query)", text: $query, onCommit: {
                        
                        if self.query != "" {
                            DataService.instance.searchJobs(query: self.query) { (success) in
                                if success {
                                    self.results = DataService.instance.searchJobs
                                    self.didSearch = true
                                }
                            }
                        }
                        
                    })
                    
                    
                    }.padding()
                    .background(Color(red: 238/255, green: 243/255, blue: 248/255))
                    .cornerRadius(10)
                
            }.padding()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(self.results, id: \.self){
                        job in
                        NavigationLink(destination: JobDetailView(gr: self.gr, job: job).navigationBarItems(trailing: ShareButton(gr: self.gr))) {
                            ResultItem(gr: self.gr, job: job)
                        }.accentColor(.black)
                        
                    }
                    
                }.padding(.bottom, gr.size.height*0.1)
            }
        }.background(Color.white)//vstack
        
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            ResultsView(gr: gr, query: .constant("software engineer"), didSearch: .constant(true), results: .constant([]))
        }
    }
}
