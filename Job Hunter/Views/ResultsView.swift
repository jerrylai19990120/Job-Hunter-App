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
    
    var body: some View {
        
        VStack {
            
            HStack{
                Image(systemName: "arrow.left")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: gr.size.width*0.06, height: gr.size.width*0.06)
                
                HStack {
                    Image(systemName: "magnifyingglass")
                    
                    TextField("\(query)", text: $query)
                    
                    }.padding()
                    .background(Color(red: 238/255, green: 243/255, blue: 248/255))
                    .cornerRadius(10)
                
            }.padding()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ResultItem(gr: gr)
                    ResultItem(gr: gr)
                    ResultItem(gr: gr)
                    ResultItem(gr: gr)
                    ResultItem(gr: gr)
                    ResultItem(gr: gr)
                    ResultItem(gr: gr)
                    ResultItem(gr: gr)
                }.padding(.bottom, gr.size.height*0.1)
            }
        }.background(Color.white)//vstack
        
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            ResultsView(gr: gr, query: .constant("software engineer"))
        }
    }
}
