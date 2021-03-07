//
//  CreatePostView.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 3/6/21.
//

import SwiftUI




struct CreatePostView: View {
    
    @EnvironmentObject var appState:AppState
    
    @State var title:String = ""
    @State var description:String = ""
    
    init(){
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        VStack {
            DiscussionHeader(title: "Create Post", previousScreen: .discussion)
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
}

struct CreatePostView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePostView()
            .environmentObject(AppState())
    }
}
