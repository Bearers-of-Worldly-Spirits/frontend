//
//  LoadingIndicator.swift
//  OpenTax
//
//  Created by Josh Arnold on 2/11/21.
//

import SwiftUI

struct LoadingIndicator: View {
    
    @State private var isLoading = false
    @State private var lineLength:CGFloat = 0.2
    
    var body: some View {
        
        ZStack {
            
            Circle()
                .stroke(Color(.systemGray5), lineWidth: 12)
                .frame(width: 100, height: 100, alignment: .center)
            
            Circle()
                .trim(from: 0, to: lineLength)
                .stroke(style: StrokeStyle(lineWidth: 12, lineCap: .round))
                .fill(Color(.primary))
                .frame(width: 100, height: 100, alignment: .center)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false))
        }        
        .onAppear() {
            self.isLoading = true
        }
    }
}

struct LoadingIndicator_Previews: PreviewProvider {
    static var previews: some View {
        LoadingIndicator()
    }
}
