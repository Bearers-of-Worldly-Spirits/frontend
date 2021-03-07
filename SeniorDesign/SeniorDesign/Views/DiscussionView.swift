//
//  DiscussionView.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 3/6/21.
//

import SwiftUI
import Parse


struct DiscussionHeader: View {
    
    var title:String = "Discussions"
    var previousScreen:AppView = .home
        
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
            }
        }
    }
}


struct DiscussionView: View {
    
    @EnvironmentObject var appState:AppState
    
    @State var posts:[Post] = [
        Post(object: nil, title: "Hello", description: "World"),
        Post(object: nil, title: "Hello", description: "World"),
        Post(object: nil, title: "Hello", description: "World"),
        Post(object: nil, title: "Hello", description: "World"),
        Post(object: nil, title: "Hello", description: "World"),
        Post(object: nil, title: "Hello", description: "World"),
    ]
    
    
    var body: some View {
        
        ZStack {
            
            // Scroll view
            ScrollView {
                DiscussionHeader()
                    .environmentObject(appState)
                Divider()                
                ForEach(posts, id: \.self) { post in
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(Color(.secondarySystemBackground))
                        .frame(maxWidth:.infinity, minHeight: 175)
                        .padding([.top, .leading, .trailing])
                }
            }
            
            // Circle button
            VStack {
                Spacer()
                CircleButton() {
                    appState.currentScreen = .createPost
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(Color(.systemBackground))
    }
}

struct DiscussionView_Previews: PreviewProvider {
    static var previews: some View {
        DiscussionView()
            .environmentObject(AppState())
    }
}
