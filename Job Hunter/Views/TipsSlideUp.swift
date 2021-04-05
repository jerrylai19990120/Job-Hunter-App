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
    
    var tips = [
        "Research the industry and company.","Clarify your \"selling points\" and the reasons you want the job.","Anticipate the interviewer's concerns and reservations.","Prepare for common interview questions.","Line up your questions for the interviewer.","Practice, practice, practice.",
        "Score a success in the first five minutes.","Get on the same side as the interviewer.","Be assertive and take responsibility for the interview.","Be ready to handle illegal and inappropriate questions.","Make your selling points clear.","Think positive.",
        "Close on a positive note.","Bring a copy of your resume to every interview.","Don't worry about sounding \"canned\".","Make the most of the \"Tell me about yourself\" question.","Speak the right body language.","Be ready for \"behavior-based\" interviews.",
        "Send thank-you notes.","Don't give up!"
    ]
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                Text("20 TIPS FOR GREAT JOB INTERVIEWS")
                    .font(.system(size: self.gr.size.width*0.04, weight: .medium, design: .default))
                
                ForEach(self.tips, id: \.self){
                    tip in
                    HStack {
                        Image(systemName: "circle")
                            .foregroundColor(Color("secondaryPurple"))
                            .font(.system(size: self.gr.size.width*0.03, weight: .medium, design: .default))
                        
                        Text(tip)
                            .foregroundColor(.gray)
                            .font(.system(size: self.gr.size.width*0.035, weight: .regular, design: .default))
                    }
                    
                }
                
            }.padding()
        }
        
    }
}

struct TipsSlideUp_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            TipsSlideUp(gr: gr)
        }
    }
}
