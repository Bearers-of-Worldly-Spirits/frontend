//
//  DiscussionCarousel.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 3/4/21.
//

import SwiftUI

struct DiscussionCarousel: View {
    
    var action: () -> ()
    
    var body: some View {
        VStack(alignment: .leading) {
                        
            HStack {
                Text("Join the").foregroundColor(Color(.label))
                Text("Discussion").foregroundColor(Color("Primary"))
            }
            .dynamicFont(min: 16, step: 0.7, weight: .bold)
            .padding([.leading, .top])
            
            ScrollView (.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    Spacer(minLength: 15)
                    
                    ImageCardButton(title: "General Forum") {
                        
                    }                        
                    
                    Spacer(minLength: 15)
                 }
                 .frame(maxHeight: .infinity)
            }.frame(height: 160)
        }
    }
}

struct DiscussionCarousel_Previews: PreviewProvider {
    static var previews: some View {
        DiscussionCarousel() {}
    }
}
