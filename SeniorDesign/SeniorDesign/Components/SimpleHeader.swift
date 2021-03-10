//
//  DiscussionHeader.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 3/9/21.
//

import SwiftUI


struct SimpleHeader: View {
    
    var title:String = "Discussions"
    var previousScreen:AppView = .home
    var actionButtonTitle:String = ""
    var action: (() -> ())?
        
    @EnvironmentObject var appState:AppState
    
    
    var body: some View {
        ZStack {
            HStack {
                Text(title)
                    .scaledFont(size: 18, name: Theme.font.medium, max: 21)
                    .foregroundColor(Color("Primary"))
            }
            .frame(maxWidth: .infinity)
            HStack {
                BackButton {appState.currentScreen = previousScreen}
                Spacer()
                if (actionButtonTitle != "") {
                    Button(actionButtonTitle, action: action ?? {})
                        .scaledFont(size: 13, name: Theme.font.bold, max: 16)
                        .foregroundColor(Color("Primary"))
                        .padding()
                }
            }
        }
    }
}


struct DiscussionHeader_Previews: PreviewProvider {
    static var previews: some View {
        SimpleHeader(title: "Title", previousScreen: .home, actionButtonTitle: "Post", action: {
            
        })
        .environmentObject(AppState())
    }
}
