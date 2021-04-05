//
//  TipsSlideUp.swift
//  Job Hunter
//
//  Created by Jerry Lai on 2021-04-04.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct TipsSlideUp: View {
    
    var gr: GeometryProxy
    
    var body: some View {
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct TipsSlideUp_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            TipsSlideUp(gr: gr)
        }
    }
}
