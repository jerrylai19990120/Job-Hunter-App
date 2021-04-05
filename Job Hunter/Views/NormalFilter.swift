//
//  NormalFilter.swift
//  Job Hunter
//
//  Created by Jerry Lai on 2021-04-05.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct NormalFilter: View {
    
    var gr: GeometryProxy
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                Text("Full Time")
                    .font(.system(size: gr.size.width*0.046, weight: .regular, design: .default))
                    
                
                Divider()
                
                Text("Part Time")
                    .font(.system(size: gr.size.width*0.046, weight: .regular, design: .default))
                
                Divider()
                
                Text("Contract")
                    .font(.system(size: gr.size.width*0.046, weight: .regular, design: .default))
                
                Divider()
                
                Text("Permanent")
                    .font(.system(size: gr.size.width*0.046, weight: .regular, design: .default))
            }.padding()
        }
    }
}

struct NormalFilter_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            NormalFilter(gr: gr)
        }
    }
}
