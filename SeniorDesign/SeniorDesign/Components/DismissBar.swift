//
//  DismissBar.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 2/16/21.
//

import SwiftUI

struct DismissBar: View {
    
    var dismiss: () -> ()
    
    var body: some View {
        Button(action: dismiss) {
            HStack {
                Image("Down")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color(.tertiaryLabel))
                    .frame(width: 30, height: 30, alignment: .center)
                    .padding([.leading, .trailing])
                Spacer()
            }
        }
    }
}

struct DismissBar_Previews: PreviewProvider {
    static var previews: some View {
        DismissBar() {
            
        }
    }
}
