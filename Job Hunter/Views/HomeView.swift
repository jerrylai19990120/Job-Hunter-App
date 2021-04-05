//
//  HomeView.swift
//  Job Hunter
//
//  Created by Jerry Lai on 2021-03-19.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI
import SlideOverCard

struct HomeView: View {
    
    var gr: GeometryProxy
    
    @State var feature = [Job]()
    
    @State var query = ""
    
    @State var didSearch = false
    
    @State var results: [Job] = [Job(title: "Loading", company: "Loading", desc: "Loading", url: "Loading", lat: "Loading", lng: "Loading", contract: "Loading", created: "Loading", location: "Loading")]
        
    @State private var position = CardPosition.bottom
    @State private var background = BackgroundStyle.blur
    
    var body: some View {
        
        ZStack {
            if didSearch {
                ResultsView(gr: gr, query: self.$query, didSearch: $didSearch, results: self.$results)
            } else {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color("primaryPurple"), Color("secondaryPurple")]), startPoint: .trailing, endPoint: .leading)
                    Rectangle()
                        .fill(Color(red: 244/255 , green: 245/255, blue: 249/255))
                        .offset(y: gr.size.height*0.24)
                    
                    //Header Stack
                    VStack(spacing: 0) {
                        SearchHeader(gr: gr, query: self.$query, didSearch: self.$didSearch, results: self.$results)
                            .frame(height: gr.size.height*0.22)
                            
                        
                        //Main stack
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack {
                                HStack {
                                    Text("Featured Jobs")
                                        .font(.system(size: gr.size.width*0.06, weight: .medium, design: .default))
                                    Spacer()
                                }.padding([.top, .leading])
                                
                                ForEach(self.feature, id:\.self){
                                    job in
                                    NavigationLink(destination: JobDetailView(gr: self.gr, job: job).navigationBarItems(trailing: ShareButton(gr: self.gr))) {
                                        JobItem(gr: self.gr, job: job, jobs: Binding.constant([]))
                                            .padding(.bottom)
                                    }.accentColor(.black)
                                }
                                
                                
                                Divider().padding()
                                
                                HomeViewBanner(gr: gr, slideup: self.$position)
                                
                            }.padding(.bottom, gr.size.height*0.12)
                            
                        }
                        
                        
                    }.padding(.top)// v stack
                        
                }.edgesIgnoringSafeArea(.top)
                
            }
            
            
            SlideOverCard($position, backgroundStyle: $background) {
                    TipsSlideUp(gr: self.gr)
            }
            
            
        }.navigationBarTitle("")
        .navigationBarHidden(true)
        .onAppear {
            DataService.instance.getFeatureJobs { (done) in
                if done {
                    self.feature = DataService.instance.featureJobs
                }
            }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            HomeView(gr: gr)
        }
    }
}

struct SearchHeader: View {
    
    var gr: GeometryProxy
    
    @Binding var query: String
    
    @Binding var didSearch: Bool
    
    @Binding var results: [Job]
    
    var body: some View {
        VStack{
            HStack {
                TextField("Search Job", text: self.$query, onCommit: {
                    DataService.instance.searchJobs(query: self.query) { (success) in
                        if success {
                            self.results = DataService.instance.searchJobs
                            self.didSearch = true
                        }
                    }
                })
                
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: gr.size.width*0.06, height: gr.size.width*0.06)
            }.padding()
                .background(Color.white)
                .cornerRadius(16)
            
            HStack {
                HStack {
                    Image(systemName: "line.horizontal.3.decrease.circle.fill")
                        .resizable()
                        .frame(width: gr.size.width*0.04, height: gr.size.width*0.04)
                        .foregroundColor(.white)
                    
                    Text("Filters")
                        .foregroundColor(.white)
                        .font(.system(size: gr.size.width*0.04, weight: .regular, design: .rounded))
                }.padding()
                    .background(Color(red: 148/255, green: 101/255, blue: 251/255))
                    .cornerRadius(18)
                
                Spacer()
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                        .resizable()
                        .frame(width: gr.size.width*0.04, height: gr.size.width*0.04)
                        .foregroundColor(.white)
                    Text("Location")
                        .foregroundColor(.white)
                        .font(.system(size: gr.size.width*0.04, weight: .regular, design: .rounded))
                }.padding()
                    .background(Color(red: 148/255, green: 101/255, blue: 251/255))
                    .cornerRadius(18)
                
                Spacer()
                HStack {
                    Image(systemName: "square.grid.2x2.fill")
                        .resizable()
                        .frame(width: gr.size.width*0.04, height: gr.size.width*0.04)
                        .foregroundColor(.white)
                    Text("Category")
                        .foregroundColor(.white)
                        .font(.system(size: gr.size.width*0.04, weight: .regular, design: .rounded))
                }.padding()
                    .background(Color(red: 148/255, green: 101/255, blue: 251/255))
                    .cornerRadius(18)
            }
            
        }.padding()

    }
}

struct ShareButton: View {
    
    var gr: GeometryProxy
    
    var body: some View {
        Image(systemName: "square.and.arrow.up")
            .resizable()
            .frame(width: gr.size.width*0.05, height: gr.size.width*0.06)
            .foregroundColor(.white)
            .font(Font.title.weight(.bold))
            
    }
}
