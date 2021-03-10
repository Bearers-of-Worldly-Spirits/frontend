//
//  PostView.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 3/9/21.
//

import SwiftUI
import Parse


struct PostView: View {
    
    
    @EnvironmentObject var appState:AppState
    @State private var userComment:String = ""
    @State private var comments:[Comment] = []
    
    
    var body: some View {
        ZStack {
            ScrollView {
                SimpleHeader(title: "Post", previousScreen: .discussion)
                    .environmentObject(appState)
                
                Divider()
                            
                HStack {
                    
                    VoteCounter(post: appState.recentPost)
                        .padding(.trailing)
                    
                    VStack(alignment: .leading) {
                        
                        Group {
                            HStack {
                                Text(getUsername())
                                Spacer()
                                Text(getDate())
                            }
                            .scaledFont(size: 14, name: Theme.font.medium)
                            .lineLimit(1)
                            .foregroundColor(Color(.secondaryLabel))
                        }
                        
                        Group {
                            Text(getTitle())
                                .scaledFont(size: 20, name: Theme.font.bold)
                        }
                        
                        Group {
                            Text(getDescription())
                                .scaledFont(size: 15, name: Theme.font.medium)
                                .foregroundColor(Color(.secondaryLabel))
                        }
                    }
                    .padding(5)
                    .lineLimit(200)
                    
                    Spacer()
                }
                .padding()
                        
                Divider()
                
                // Comments section here, for each
                ForEach(comments, id: \.self) { comment in
                    CommentView(comment: comment)
                    Spacer()
                }
            }
//            .padding()
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
            HoverTextfield(text: $userComment) {postComment()}
        }
        .onAppear() {
            loadComments()
        }
    }
            
    func getTitle() -> String {
        return appState.recentPost.object?.object(forKey: "title") as? String ?? "Title"
    }
    
    func getDescription() -> String {
        return appState.recentPost.object?.object(forKey: "description") as? String ?? "Description"
    }
    
    func getUsername() -> String {
        return "@"+((appState.recentPost.object?.object(forKey: "user") as? PFUser)?.object(forKey: "name") as? String ?? "user").lowercased().replacingOccurrences(of: " ", with: "")
    }
    
    func getDate() -> String {
        return (appState.recentPost.object?.createdAt ?? Date())
            .timeAgoDisplay()
            .replacingOccurrences(of: ". ago", with: "")
    }
    
    func postComment() {
        if userComment == "" {return}
        guard PFUser.current() != nil && appState.recentPost.object != nil else {return}
        let comment = PFObject(className: "Comment")
        comment["text"] = userComment
        comment["post"] = appState.recentPost.object
        comment["user"] = PFUser.current()!
        
        appState.isLoading = true
        comment.saveInBackground { (done, error) in
            self.appState.isLoading = false
            if done == true && error == nil {
                self.userComment = ""
                UIApplication.shared.endEditing()
                loadComments()
            }else{
                self.appState.alertMessage = error?.localizedDescription ?? "Something absolutely catastrophic has occured."
                self.appState.isShowingAlert = true
            }
        }
    }
    
    func loadComments() {
        guard appState.recentPost.object != nil else {return}
        let query = PFQuery(className: "Comment")
        query.whereKey("post", equalTo: appState.recentPost.object!)
        query.addDescendingOrder("createdAt")
        query.includeKey("user")
        query.findObjectsInBackground { (objects, error) in
            if objects == [] || error != nil {return}
            withAnimation {self.comments = objects!.map {
                Comment(
                    username: "@"+(($0.object(forKey: "user") as? PFUser)?.object(forKey: "name") as? String ?? "user").lowercased().replacingOccurrences(of: " ", with: ""),
                    text: $0.object(forKey: "text") as? String ?? "<Comment>",
                    date: $0.createdAt ?? Date(),
                    object: $0)
                }
            }
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
            .environmentObject(AppState())
    }
}
