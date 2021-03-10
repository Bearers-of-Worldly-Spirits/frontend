//
//  DiscussionView.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 3/6/21.
//

import SwiftUI
import Parse


struct DiscussionView: View {
    
    @EnvironmentObject var appState:AppState
    
    @State var posts:[Post] = []
    
    
    var body: some View {
        
        ZStack {
            
            // Scroll view
            ScrollView {
                SimpleHeader()
                    .environmentObject(appState)
                Divider()                
                ForEach(posts, id: \.self) { post in
                    DiscussionPost(post: post)
                }
            }
            
            // Circle button
            VStack {
                Spacer()
                CircleButton() { appState.currentScreen = .createPost }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(Color(.systemBackground))
        .onAppear {
            loadPosts()
        }
    }
    
    
    func loadPosts() {
        guard PFUser.current() != nil else {return}
        let query = PFQuery(className: "Post")
        query.order(byDescending: "createdAt")
        query.includeKey("user")
        query.findObjectsInBackground { (objects, error) in
            if objects == nil {return}
            if let objects = objects {
                withAnimation {
                    self.posts = objects.map {Post(object: $0, title: $0.object(forKey: "title") as? String ?? "", description: $0.object(forKey: "description") as? String ?? "")}
                }
            }
        }
    }
}

struct DiscussionView_Previews: PreviewProvider {
    static var previews: some View {
        DiscussionView()
            .environmentObject(AppState())
    }
}
