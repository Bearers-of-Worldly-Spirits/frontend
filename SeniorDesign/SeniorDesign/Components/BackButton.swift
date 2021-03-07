//
//  BackButton.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 3/6/21.
//

import SwiftUI

struct BackButton: View {
    
    var tapped: () -> ()
    
    var body: some View {
        Button(action: {
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
            tapped()
        }) {
            HStack {
                Image(systemName: "arrow.left")
                Text("Back")
            }
            .padding()
            .foregroundColor(Color(.tertiaryLabel))
            .scaledFont(size: 13, name: Theme.font.bold, max: 16)
//            .foregroundColor(Color("Primary"))
        }
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton() {
            
        }
    }
}
