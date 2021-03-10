//
//  HoverTextfield.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 3/10/21.
//

import SwiftUI

struct HoverTextfield: View {
        
    @Binding var text:String
    @ObservedObject private var kGuardian = KeyboardGuardian(textFieldCount: 1)
    @State private var isEditing:Bool = false
    
    var sendMessage: () -> ()
    
    var body: some View {
        
        VStack {
            Spacer()
            HStack {
                TextField("Type comment...", text: $text, onEditingChanged: { (changed) in
                    if changed {
                        withAnimation {isEditing = true}
                    }else{
                        withAnimation {isEditing = false}
                    }
                })
                .autocapitalization(.sentences)
                .scaledFont(size: 14, name: Theme.font.medium)
                .foregroundColor(Color.white)
                .accentColor(Color.white)
                .padding(.leading, 30)
                .frame(height: isEditing == false ? 60 : 75)
                
                Spacer()

                Button(action: sendMessage) {
                    Circle()
                        .shadow(color: isEditing == false ? Color(UIColor(white: 0, alpha: 0.25)) : .clear, radius: isEditing == false ? 5 : 0)
                        .frame(width: 60, height: 60, alignment: .center)
                        .foregroundColor(Color("Primary"))
                        .overlay(
                            Image(systemName: "bubble.left.fill")
                                .foregroundColor(Color.white)
                        )
                        .padding(isEditing == false ? [] : [.trailing], 8)
                }
            }
            .padding(5)
            .background(
                RoundedRectangle(cornerRadius: isEditing == false ? 50.0 : 0.0, style: .continuous)
                    .fill(Color("Primary"))
                    .shadow(radius: isEditing == false ? 10 : 0)
            )
            .padding(isEditing == false ? [.all] : [])
            .frame(maxWidth: isEditing == false ? Theme.maxScreenWidth : .infinity)
        }
        .offset(y: kGuardian.slide).animation(.easeInOut(duration: 0.35))
        .background(GeometryGetter(rect: $kGuardian.rects[0]))
    }
}

struct HoverTextfield_Previews: PreviewProvider {
    static var previews: some View {
        HoverTextfield(text: .constant("")) {
            
        }
    }
}
