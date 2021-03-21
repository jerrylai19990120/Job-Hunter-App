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
  
        GeometryReader { gr in
            NavigationView {
                ZStack {
                    Color(red: 244/255 , green: 245/255, blue: 249/255)
                    
                    if self.selection == 0 {
                        HomeView(gr: gr)
                            
                    }
                    
                    if self.selection == 1 {
                        SearchView()
                    }
                    
                    if self.selection == 2 {
                        BookmarkView()
                    }
                    
                    VStack {
                        Spacer()
                        BottomTabBar(gr: gr, selection: self.$selection)
                    }.edgesIgnoringSafeArea(.bottom)
                    
                    
                }.navigationBarTitle("")//.edgesIgnoringSafeArea(.top)
            }.accentColor(.white)
            //nav view
        }//geo reader
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabNavView()
    }
}
