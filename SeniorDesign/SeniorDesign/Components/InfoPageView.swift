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
    
    var body: some View {
        
        PageView(pageCount: 3, currentIndex: $idx) {
            
            VStack {
                LottieView(name: "form.min", speed: 0.15)
                    .frame(maxWidth:.infinity, maxHeight: 200)
                Text("Taxes can be difficult.")
                    .padding()
                    .multilineTextAlignment(.center)
                    .font(Font.system(.body))
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            VStack {
                LottieView(name: "apps.min", speed: 0.35)
                    .frame(maxWidth:.infinity, maxHeight: 200)
                Text("We make it as simple as tapping a few buttons.")
                    .padding([.leading, .trailing], 50)
                    .multilineTextAlignment(.center)
                    .font(Font.system(.body))
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            VStack {
                LottieView(name: "clock.min", speed: 0.35)
                    .frame(maxWidth:.infinity, maxHeight: 200)
                Text("Melon saves you time 🎉")
                    .padding()
                    .multilineTextAlignment(.center)
                    .font(Font.system(.body))
                    .foregroundColor(Color(.secondaryLabel))
            }
        }
        .indicator(current: UIColor(Color("Primary")), other: UIColor.secondarySystemBackground)
        .frame(maxHeight: 400)
    }
}

struct InfoPageView_Previews: PreviewProvider {
    static var previews: some View {
        InfoPageView()
    }
}
