//
//  PageView.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 2/25/21.
//

import SwiftUI
import CAPageView
import Lottie


struct InfoPageView: View {
    
    @State private var idx:Int = 0
    
    private var size:CGFloat = 250
    
    var body: some View {
        
        PageView(pageCount: 3, currentIndex: $idx) {
            
            Group {
                VStack {
                    LottieView(name: "form.min", speed: 0.15)
                        .frame(maxWidth:.infinity)
                        .frame(height: size)
                    Text("Taxes can be difficult.")
                        .frame(maxWidth: Theme.maxScreenWidth)
                        .padding(.bottom, 50)
                }
                
                VStack {
                    LottieView(name: "apps.min", speed: 0.35)
                        .frame(maxWidth:.infinity, maxHeight: size)
                    Text("We make it as simple as tapping a few buttons.")
                        .frame(maxWidth: Theme.maxScreenWidth)
                        .padding(.bottom, 50)
                }
                
                VStack {
                    LottieView(name: "clock.min", speed: 0.35)
                        .frame(maxWidth:.infinity, maxHeight: size)
                    Text("Melon saves you time 🎉")
                        .frame(maxWidth: Theme.maxScreenWidth)
                        .padding(.bottom, 50)
                }
            }
            .dynamicFont(min: 15, step: 0.5)
            .multilineTextAlignment(.center)
            .lineLimit(5)
            .foregroundColor(Color(.secondaryLabel))
        }
        .indicator(current: UIColor(Color("Primary")), other: UIColor.secondarySystemBackground)
        .frame(minHeight: size+50+10, maxHeight: .infinity)
    }
}

struct InfoPageView_Previews: PreviewProvider {
    static var previews: some View {
        InfoPageView()
    }
}
