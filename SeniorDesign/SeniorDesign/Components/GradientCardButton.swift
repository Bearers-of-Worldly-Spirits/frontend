//
//  GradientCardButton.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 2/15/21.
//

import SwiftUI

struct GradientCardButton: View {
    
    var title:String
    var gradient:Gradient = Gradient(colors: [Color.red, Color.orange])
    var action: () -> ()
    
    @State private var opacity = 1.0
    
    var body: some View {                            
        VStack {            
            Text(title)
            Image("Form").renderingMode(.template)
                .resizable()
                .frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
        .foregroundColor(Color(.white))
        .frame(width: 250, height: 135, alignment: .center)
        .background(
            RoundedRectangle(cornerRadius: 23, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                .fill(LinearGradient(gradient: gradient, startPoint: .bottomLeading, endPoint: .topTrailing))
                .shadow(radius: 7)
        )
        .opacity(opacity)        
        .foregroundColor(Color("Background"))        
        .scaledFont(size: 14, name: Theme.font.bold)
        .onTapGesture {
            
            opacity = 0.25
            
            withAnimation(Animation.linear(duration: 0.25)) {
                opacity = 1.0
            }
                        
            UIImpactFeedbackGenerator(style: .heavy).impactOccurred() // Impact!
            
            action()
        }
        .gesture(DragGesture(minimumDistance: 0))
        

    }
}

struct GradientCardButton_Previews: PreviewProvider {
    static var previews: some View {
        GradientCardButton(title: "Form 8843") {
            
        }
    }
}
