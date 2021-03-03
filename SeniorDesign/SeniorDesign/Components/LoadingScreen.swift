//
//  LoadingScreen.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 3/3/21.
//

import SwiftUI
import ActivityIndicatorView


struct LoadingScreen: View {
    
    @Binding var isLoading:Bool
    
    var body: some View {
        ZStack {
            if (isLoading == true) {
                Rectangle()
                    .fill(Color(UIColor(white: 0, alpha: 0.35)))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
                        
            ActivityIndicatorView(isVisible: $isLoading, type: .arcs)
                .frame(width: 50.0, height: 50.0)
                .foregroundColor(Theme.primaryColor)
        }
        .transition(.opacity)
        .ignoresSafeArea()
    }
}

struct LoadingScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoadingScreen(isLoading: .constant(true))
    }
}
