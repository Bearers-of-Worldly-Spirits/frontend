//
//  DiscussionPost.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 3/9/21.
//

import SwiftUI
import Parse


struct DiscussionPost: View {
    
    var post:Post
                
    var body: some View {
        HStack {
            
            VoteCounter(post: post)
                .padding(.trailing)
            
            Spacer()
                                                
            VStack {
                                
                HStack {
                    Text(getUsername())
                    Spacer()
                    Text(getDate())
                    
                }
                .scaledFont(size: 14, name: Theme.font.medium)
                .lineLimit(1)
                .foregroundColor(Color(.secondaryLabel))
                
                HStack {
                    Text(post.title)
                        .scaledFont(size: 20, name: Theme.font.bold)
                        .lineLimit(2)
                    Spacer()
                }
                                     
                HStack {
                    Text(post.description)
                        .scaledFont(size: 15, name: Theme.font.medium)
                        .foregroundColor(Color(.secondaryLabel))
                        .lineLimit(2)
                    Spacer()
                }
            }
        }
        .padding()
    }
    
    func getUsername() -> String {
        return "@"+((post.object?.object(forKey: "user") as? PFUser)?.object(forKey: "name") as? String ?? "user").lowercased().replacingOccurrences(of: " ", with: "")
    }
    
    func getDate() -> String {
        return (post.object?.createdAt ?? Date())
            .timeAgoDisplay()
            .replacingOccurrences(of: ". ago", with: "")
    }
}

struct DiscussionPost_Previews: PreviewProvider {
    static var previews: some View {
        DiscussionPost(post: Post(object: nil, title: "Hello World", description: "Blah blah blah!"))
    }
}
