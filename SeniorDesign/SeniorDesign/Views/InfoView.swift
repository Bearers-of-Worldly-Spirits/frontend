//
//  InfoView.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 2/16/21.
//

import SwiftUI

struct InfoView: View {
    
    var formNumber:String = "8843"
    var description:String = "Blah"
    var done: () -> ()
    var canceled: () -> ()
    
    var body: some View {
        
        GeometryReader(content: { geometry in
                    
            ScrollView {
                
                VStack {
                    
                    DismissBar(dismiss: canceled)
                
                    HStack {
                        
                        Text("Form")
                            .foregroundColor(Color(.label))
                            .font(Font.custom(Theme.fontName, size: 27).weight(.bold))
                        
                        Text(formNumber)
                            .foregroundColor(Color("Primary"))
                            .font(Font.custom(Theme.fontName, size: 27).weight(.light))
                    }
                    
                    .padding()
                    
                    Text(description)
                        .foregroundColor(Color(.secondaryLabel))
                        .multilineTextAlignment(.center)
                        .font(Font.custom(Theme.fontName, size: 15).weight(.medium))
                        .frame(maxWidth: Theme.maxScreenWidth)
                    
                    Spacer()
                    
                    ButtonFill(title: "Continue", action: done)
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
            .background(Color("Background").ignoresSafeArea())
        })
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView {
            
        } canceled: {
            
        }
    }
}
