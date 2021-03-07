//
//  CircleButton.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 3/6/21.
//

import SwiftUI

struct CircleButton: View {
    
    var tapped: () -> ()
    var size:CGFloat = 90
    
    var body: some View {
        
        Button(action: {
            let impactMed = UIImpactFeedbackGenerator(style: .medium)
            impactMed.impactOccurred()
            tapped()
        }) {
            Circle()
                .fill(Color("Primary"))
                .shadow(radius: 10)
                .padding()
                .frame(width: size, height: size)
                .overlay(
                    Image(systemName: "plus")
                        .foregroundColor(Color.white)
                        .scaledFont(size: 20, name: Theme.font.bold, max: 22)
                )
        }
    }
}

struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleButton() {}
    }
}
