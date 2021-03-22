//
//  ReviewView.swift
//  Job Hunter
//
//  Created by Jerry Lai on 2021-03-21.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct ReviewView: View {
    
    var gr: GeometryProxy
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            ReviewView(gr: gr)
        }
    }
}
