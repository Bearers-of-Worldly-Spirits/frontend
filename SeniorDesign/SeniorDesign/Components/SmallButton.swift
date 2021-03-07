//
//  SmallButton.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 3/6/21.
//

import SwiftUI

struct SmallButton: View {
    
    var title:String = "Post"
    
    var action: () -> ()
    
    var body: some View {
        
        Button(action: {
            let impactMed = UIImpactFeedbackGenerator(style: .heavy)
            impactMed.impactOccurred()
            action()
        }) {
            HStack {
                Spacer(minLength: 40)
                Text(title)
                Image(systemName: "arrow.right")
                Spacer()
            }
            .scaledFont(size: 15, name: Theme.font.medium)
            .padding()
            .foregroundColor(Color("Background"))
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .fill(Theme.primaryColor))
        }
        .shadow(radius: 7.0)
        .frame(width: 150)
    }
}

struct SmallButton_Previews: PreviewProvider {
    static var previews: some View {
        SmallButton() {
            
        }
    }
}
