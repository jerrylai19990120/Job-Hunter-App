//
//  HomeView.swift
//  Job Hunter
//
//  Created by Jerry Lai on 2021-03-19.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    var gr: GeometryProxy
    
    @State var query = ""
    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("primaryPurple"), Color("secondaryPurple")]), startPoint: .trailing, endPoint: .leading)
            Rectangle()
                .fill(Color(red: 244/255 , green: 245/255, blue: 249/255))
                .offset(y: gr.size.height*0.24)
            
            //Header Stack
            VStack(spacing: 0) {
                SearchHeader(gr: gr, query: self.$query)
                    .frame(height: gr.size.height*0.22)
                    
                
                //Main stack
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        HStack {
                            Text("Featured Jobs")
                                .font(.system(size: gr.size.width*0.06, weight: .medium, design: .default))
                            Spacer()
                        }.padding([.top, .leading])
                        
                        NavigationLink(destination: JobDetailView(gr: gr).navigationBarItems(trailing: ShareButton(gr: gr))) {
                            JobItem(gr: gr)
                                .padding(.bottom)
                        }.accentColor(.black)
                        
                        JobItem(gr: gr)
                            .padding(.bottom)
                        
                        Divider().padding()
                        
                        HomeViewBanner(gr: gr)
                        
                    }.padding(.bottom, gr.size.height*0.12)
                    
                }
                
                
            }.padding(.top)// v stack
                
        }.edgesIgnoringSafeArea(.top)
        .navigationBarTitle("")
        .navigationBarHidden(true)
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
    
    var body: some View {
        VStack{
            HStack {
                TextField("Search Job", text: self.$query)
                
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
