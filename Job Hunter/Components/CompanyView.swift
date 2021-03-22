//
//  CompanyView.swift
//  Job Hunter
//
//  Created by Jerry Lai on 2021-03-21.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct CompanyView: View {
    
    var gr: GeometryProxy
    
    @State var des = "We value diversity at our company. All qualified applicants will receive consideration for employment without regard to race, color, religion, sex, sexual orientation, gender identity, national origin, or any other applicable legally protected characteristics in the location in which the candidate is applying. For job positions in San Francisco, CA, and other locations where required, we will consider for employment qualified applicants with arrest and conviction records."
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                Text("\(des)")
                    .foregroundColor(.gray)
                    .font(.system(size: gr.size.width*0.04, weight: .medium, design: .default))
                    .padding()
                    .lineSpacing(5)
            }.padding(.bottom, gr.size.height*0.4)
        }
        
    }
}

struct CompanyView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            CompanyView(gr: gr)
        }
        
    }
}
