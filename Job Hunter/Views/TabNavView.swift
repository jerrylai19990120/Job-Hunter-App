//
//  TabNavView.swift
//  Job Hunter
//
//  Created by Jerry Lai on 2021-03-19.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct TabNavView: View {
    
    @State var selection = 0
    
    var body: some View {
        NavigationView {
            GeometryReader { gr in
                ZStack {
                    Color("lightPurple")
                    BottomTabBar(gr: gr, selection: self.$selection)
                    
                }
            }//geo reader
        }//nav view
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabNavView()
    }
}
