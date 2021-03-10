//
//  VoteCounter.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 3/9/21.
//

import SwiftUI
import Parse


enum UserPostVoteStatus {
    case none, upvoted, downvoted
}


struct VoteCounter: View {
    
    var post:Post
    @State private var votes:Int = 0
    @State private var userState:UserPostVoteStatus = .none
    
    var body: some View {
        VStack(spacing: 10) {
            Button(action: {setVote(style: .upvoted)}) {
                Image(systemName: "arrow.up")
            }
            .foregroundColor(userState == .upvoted ? Color("Primary") : Color(.tertiaryLabel))
            
            Text(String(votes))
                .foregroundColor(userState == .upvoted || userState == .downvoted ? Color("Primary") : Color(.tertiaryLabel))
            
            Button(action: {setVote(style: .downvoted)}) {
                Image(systemName: "arrow.down")
            }
            .foregroundColor(userState == .downvoted ? Color("Primary") : Color(.tertiaryLabel))
        }
        .scaledFont(size: 20, name: Theme.font.bold)
        .onAppear { loadData() }
    }
                    
    func setVote(style:UserPostVoteStatus) {
        guard let id = PFUser.current()?.objectId else {return}
        
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                
        if userState != style {
            if style == .upvoted {
                post.object?.removeObjects(in: [id], forKey: "downvotes")
                post.object?.addUniqueObject(id, forKey: "upvotes")
            }
            else if style == .downvoted {
                post.object?.removeObjects(in: [id], forKey: "upvotes")
                post.object?.addUniqueObject(id, forKey: "downvotes")
            }
        }else{
            post.object?.removeObjects(in: [id], forKey: "upvotes")
            post.object?.removeObjects(in: [id], forKey: "downvotes")
        }
        post.object?.saveInBackground()
        loadData()
    }
    
    func loadData() {
        let upvotes = post.object?.object(forKey: "upvotes") as? [String] ?? []
        let downvotes = post.object?.object(forKey: "downvotes") as? [String] ?? []
        votes = upvotes.count - downvotes.count
        let userId = PFUser.current()?.objectId ?? ""
        if upvotes.contains(where: {$0 == userId}) {userState = .upvoted}
        else if downvotes.contains(where: {$0 == userId}) {userState = .downvoted}
        else {userState = .none}
    }
}

struct VoteCounter_Previews: PreviewProvider {
    static var previews: some View {
        VoteCounter(post: Post(object: nil, title: "", description: ""))
    }
}
