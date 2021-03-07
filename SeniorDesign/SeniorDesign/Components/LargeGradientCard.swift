//
//  LargeGradientCard.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 2/16/21.
//

import SwiftUI

struct LargeGradientCard: View {
    
    var title:String = "Welcome back! Your tax forms are due in 29 days."
    var gradient:Gradient = Gradient(colors: [Color.purple, Color.pink])
    
    var body: some View {
        
        HStack(alignment: .center) {
            Text(title)
                .multilineTextAlignment(.leading)
                .padding(.leading, 30)
            Image("Timer")
                .renderingMode(.template)
                .foregroundColor(.white)
                .padding(.trailing, 30)
        }
        .padding([.top, .bottom], 30)
        .foregroundColor(Color(.white))
        .frame(minHeight: 160, alignment: .center)
        .background(
            RoundedRectangle(cornerRadius: 23, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                .fill(LinearGradient(gradient: gradient, startPoint: .bottomLeading, endPoint: .topTrailing))
                .shadow(radius: 7)
        )
        .foregroundColor(Color("Background"))        
        .scaledFont(size: 16, name: Theme.font.bold)
    }
}

struct LargeGradientCard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LargeGradientCard()
            LargeGradientCard()
                .previewDevice("iPad Pro (12.9-inch) (4th generation)")
        }
        .environment(\.sizeCategory, ContentSizeCategory.accessibilityExtraExtraExtraLarge)
    }
}
