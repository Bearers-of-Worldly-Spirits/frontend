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
                    .padding(.bottom, 5)
                    .lineLimit(200)
                    
                    Spacer()
                }
                .padding([.top, .bottom])
                        
                Divider()
                
                // Comments section here, for each
            }
            .padding()
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
            
            HoverTextfield(text: $userComment) {postComment()}
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
        
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
            .environmentObject(AppState())
    }
}
