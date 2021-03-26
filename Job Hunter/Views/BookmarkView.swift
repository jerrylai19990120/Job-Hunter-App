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
    
    var body: some View {
        VStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("primaryPurple"), Color("secondaryPurple")]), startPoint: .trailing, endPoint: .leading)
                
                HStack {
                    Spacer()
                    Text("Bookmark")
                        .foregroundColor(.white)
                        .font(.system(size: gr.size.width*0.06, weight: .regular, design: .rounded))
                        .padding()
                    Spacer()
                }
            }.edgesIgnoringSafeArea(.top)
            .frame(height: gr.size.height*0.1)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    JobItem(gr: gr, isBookMarked: true)
                        .padding(.bottom)
                    JobItem(gr: gr, isBookMarked: true)
                        .padding(.bottom)
                    JobItem(gr: gr, isBookMarked: true)
                        .padding(.bottom)
                    
                }
            }
            
            
            
            
            Spacer()
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
