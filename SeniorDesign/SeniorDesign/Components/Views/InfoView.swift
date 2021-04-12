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
                            .scaledFont(size: 27, name: Theme.font.bold)
                        
                        Text(formNumber)
                            .foregroundColor(Color("Primary"))
                            .scaledFont(size: 27, name: Theme.font.medium)
                    }
                    .padding()
                    
                    LottieView(name: "form.min", speed: 0.15)
                        .frame(maxWidth:.infinity)
                        .frame(height: 170)
                    
                    Text(description)
                        .foregroundColor(Color(.secondaryLabel))
                        .multilineTextAlignment(.center)                        
                        .scaledFont(size: 15, name: Theme.font.medium)
                        .frame(maxWidth: Theme.maxScreenWidth)
                                                                                
                    Spacer()
                    
                    ButtonFill(title: "Continue", action: done)
                        .padding(.bottom, 50)
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
            .background(Color("Background").ignoresSafeArea())
        })
        .onTapGesture { UIApplication.shared.endEditing() }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView {
            
        } canceled: {
            
        }
    }
}
