//
//  LoadingView.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 2/16/21.
//

import SwiftUI

struct LoadingView: View {
    
    @State private var isLoading:Bool = false
    @State private var opacity:Double = 0
    
    var body: some View {
        
        ZStack {
            Circle()
                .trim(from: 0, to: 0.7)
                .stroke(Color("Primary"), style: StrokeStyle(lineWidth: 6, lineCap: .round))
                .frame(width: 100, height: 100)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                .opacity(opacity)
            
            Circle()
                .trim(from: 0, to: 0.8)
                .stroke(Color("Primary"), style: StrokeStyle(lineWidth: 6, lineCap: .round))
                .frame(width: 80, height: 80)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false))
                .opacity(opacity)
            
            Circle()
                .trim(from: 0, to: 0.9)
                .stroke(Color("Primary"), style: StrokeStyle(lineWidth: 6, lineCap: .round))
                .frame(width: 60, height: 60)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(Animation.linear(duration: 3).repeatForever(autoreverses: false))
                .opacity(opacity)
                
        }
        .onAppear() {
            withAnimation {
                self.isLoading = true
                self.opacity = 1.0
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
