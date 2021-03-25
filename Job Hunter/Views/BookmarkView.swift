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
            HStack {
                Spacer()
                Text("Bookmark")
                Spacer()
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
