//
//  Profile.swift
//  TaxAppComponents
//
//  Created by Shreya on 3/8/21.
//

import SwiftUI

struct Profile: View {
    var body: some View {
//        HStack {
//            Spacer()
            VStack {
                Text("Display Name").foregroundColor(.white).font(.caption)
                Image("user")
                Text("username").foregroundColor(.white).font(.caption)
                RoundedRectangle(cornerRadius: 25, style: .continuous)     .fill(Color.white)
                    .frame(width: 200, height: 2)
                Text("bio").foregroundColor(.white).font(.caption).padding(.bottom, 20)
            }//.background(Color.black)
//            Spacer()
//        }.background(Color.black)
        
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
