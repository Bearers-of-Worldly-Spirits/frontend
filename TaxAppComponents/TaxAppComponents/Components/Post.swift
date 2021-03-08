//
//  Post.swift
//  TaxAppComponents
//
//  Created by Shreya on 3/8/21.
//

import SwiftUI

struct Post: View {
    var body: some View {
        //var status: String
        
        let drop_shawdow = UIColor(red: 0.88, green: 0.88, blue: 0.88, alpha: 1.00);
        
        //let unanswered = UIColor(red: 0.77, green: 0.77, blue: 0.77, alpha: 1.00);
        let inprogress = UIColor(red: 1.00, green: 0.79, blue: 0.04, alpha: 1.00);
        //let closed = UIColor(red: 0.11, green: 0.89, blue: 0.71, alpha: 1.00);
        HStack {
            HStack {
                Image("public_profile")
                Text("Do international students need to fill out forms xyz?").font(.caption)
            }.padding(.horizontal, 20).padding(.vertical, 10)
            Circle().fill(Color.init(inprogress)).frame(width: 15, height: 15)
            Spacer()
        }.background(Color.white).cornerRadius(10.0).shadow(color: .init(drop_shawdow), radius: 5, y: 4).padding(.horizontal)
    }
}

struct Post_Previews: PreviewProvider {
    static var previews: some View {
        Post()
    }
}
