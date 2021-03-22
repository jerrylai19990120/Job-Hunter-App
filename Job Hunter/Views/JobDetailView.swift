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
    
    @State var bookMark = false
    
    var body: some View {
        
        
            
            ZStack {
                VStack {
                    Image("bg")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fill)
                        .frame(height: gr.size.height*0.26)
                        .clipped()
                    
                    Spacer()
                }
                
                
                VStack(spacing: gr.size.height*0.01){
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
                            .padding()
                            .onTapGesture {
                                self.selection = 0
                        }
                        
                        Divider().frame(height: gr.size.height*0.065)
                        
                        Text("Company")
                            .foregroundColor(selection==1 ? .black : .gray)
                            .font(.system(size: gr.size.width*0.042, weight: .medium, design: .default))
                            .padding()
                            .onTapGesture {
                                self.selection = 1
                        }
                        
                        Divider().frame(height: gr.size.height*0.065)
                        
                        Text("Reviews")
                            .foregroundColor(selection==2 ? .black : .gray)
                            .font(.system(size: gr.size.width*0.042, weight: .medium, design: .default))
                            .padding()
                            .onTapGesture {
                                self.selection = 2
                        }
                        
                    }.background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 3)
                    
                    
                    if selection == 0 {
                        DescriptionView(gr: gr)
                    }
                    
                    if selection == 1 {
                        CompanyView(gr: gr)
                    }
                    
                    if selection == 2 {
                        ReviewView(gr: gr)
                    }
                    
                    
                }.offset(y: gr.size.height*0.2)
                
                
                
                VStack {
                    Spacer()
                    ApplyJobBar(gr: gr, bookMark: $bookMark)
                }
                
            }.edgesIgnoringSafeArea(.top)
        
        
    }
}

struct JobDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            JobDetailView(gr: gr)
        }
    }
}

struct ApplyJobBar: View {
    
    var gr: GeometryProxy
    
    @Binding var bookMark: Bool
    
    var body: some View {
        HStack(spacing: 8) {
            
            Image(systemName: bookMark ? "bookmark.fill" : "bookmark")
                .resizable()
                .frame(width: gr.size.width*0.05, height: gr.size.width*0.06)
                .padding()
                .background(Color(red: 228/255, green: 230/255, blue: 233/255))
                .cornerRadius(10)
                .onTapGesture {
                    self.bookMark.toggle()
                }
            
            HStack {
                Spacer()
                Text("Apply Now")
                    .font(.system(size: gr.size.width*0.05, weight: .medium, design: .default))
                    .foregroundColor(.white)
                Spacer()
            }.padding()
                .background(Color("primaryPurple"))
                .cornerRadius(10)
            
        }.padding()
            .frame(width: gr.size.width)
            .background(Color.white)
    }
}
