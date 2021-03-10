//
//  CommentView.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 3/10/21.
//

import SwiftUI
import Parse


struct CommentView: View {
    
    var comment:Comment = Comment(username: "@josharnold", text: "Great post!", date: Date(), object: PFObject(className: "Comment"))
    
    var body: some View {
        VStack {
            
            HStack {
                Text(comment.username)
                    .padding(.bottom, 1)
                Spacer()
                Text(comment.date.timeAgoDisplay())                    
            }
            .foregroundColor(Color(.secondaryLabel))
            .scaledFont(size: 13, name: Theme.font.medium)
            .lineLimit(1)
            
            HStack {
                Text(comment.text)
                    .scaledFont(size: 15, name: Theme.font.medium)
                    .foregroundColor(Color(.label))
                    .lineLimit(50)
                Spacer()
            }
        }
        .padding()
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView()
    }
}
