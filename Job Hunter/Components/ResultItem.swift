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
    
    @State var isBookMarked = false
    
    var body: some View {
        VStack {
            HStack {
                Image("google")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: gr.size.width*0.16, height: gr.size.width*0.16)
                
                VStack(alignment: .leading) {
                    Text("Software Engineer")
                        .font(.system(size: gr.size.width*0.054, weight: .medium, design: .default))
                    Text("Google")
                        .font(.system(size: gr.size.width*0.04, weight: .regular, design: .default))
                    
                    Text("Waterloo, ON")
                        .foregroundColor(.gray)
                        .font(.system(size: gr.size.width*0.04, weight: .regular, design: .default))
                }
                Spacer()
                
                Image(systemName: isBookMarked ? "bookmark.fill" : "bookmark")
                    .foregroundColor(.gray)
                    .font(.system(size: gr.size.width*0.04, weight: .medium, design: .default))
                    .onTapGesture {
                        self.isBookMarked.toggle()
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
