//
//  ImageCardButton.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 3/4/21.
//

import SwiftUI

struct ImageCardButton: View {
    
    var title:String
    var imageName:String = "City"
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
                Image(imageName)
                    .resizable()
                    .overlay(Color(UIColor(white: 0, alpha: 0.35)))
                    .cornerRadius(23)
                    .shadow(radius: 7)
        )
        .opacity(opacity)
        .foregroundColor(Color("Background"))
        .dynamicFont(min: 14, step: 0.5, weight: .bold)
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

struct ImageCardButton_Previews: PreviewProvider {
    static var previews: some View {
        ImageCardButton(title: "Hello world") {}
    }
}
