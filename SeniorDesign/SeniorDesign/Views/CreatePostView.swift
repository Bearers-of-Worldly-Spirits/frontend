//
//  CreatePostView.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 3/6/21.
//

import SwiftUI
import Parse


struct CreatePostView: View {
    
    @EnvironmentObject var appState:AppState
    
    @AppStorage("CreatePostTitle") var title:String = ""
    @AppStorage("CreatePostDesc") var description:String = ""
    
    init(){
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        VStack {
            SimpleHeader(title: "Create Post", previousScreen: .discussion, actionButtonTitle: "Post") {
                postDiscussion()
            }
            .environmentObject(appState)
         
            Form {
                TextField("Title", text: $title)
                    .autocapitalization(.words)
                
                TextArea("Description", text: $description)
                    .foregroundColor(Color(.secondaryLabel))
            }
            .background(Color(.systemBackground))
            .foregroundColor(Color("Primary"))
            .accentColor(Color("Primary"))
            .scaledFont(size: 16, max: 18)
            .onTapGesture {UIApplication.shared.endEditing()}
        }
    }
    
    func postDiscussion() {
        
        if title == "" || description == "" {
            appState.alertMessage = "Please add both a title and a description!"
            appState.isShowingAlert = true
            return
        }
        
        guard PFUser.current() != nil else {
            return
        }
                
        let post = PFObject(className: "Post")
        post["user"] = PFUser.current()!
        post["title"] = title
        post["description"] = description
        post["upvotes"] = []
        post["downvotes"] = []
        
        appState.isLoading = true
        
        post.saveInBackground { (success, error) in
            self.appState.isLoading = false
            
            if error != nil || success == false {
                self.appState.alertMessage = error?.localizedDescription ?? "Something went wrong!"
                self.appState.isShowingAlert = true
                return
            }
                        
            self.appState.currentScreen = .discussion
            title = ""
            description = ""
        }
        
    }
}

struct CreatePostView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePostView()
            .environmentObject(AppState())
    }
}
