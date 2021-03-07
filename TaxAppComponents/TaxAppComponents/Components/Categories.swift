//
//  Categories.swift
//  TaxAppComponents
//
//  Created by Shreya on 3/6/21.
//

import SwiftUI

struct Categories: View {
    var body: some View {
        let teal = UIColor(red: 0.0549, green: 0.9137, blue: 0.8902, alpha: 1.0);
        
        let space = Spacer().frame(width: 15);
        
        VStack {
            HStack {
                space
                SingleCategory()
                Spacer()
                SingleCategory()
                Spacer()
                SingleCategory()
                space
            }.padding(.all, 10)
            
            HStack {
                space
                SingleCategory()
                Spacer()
                SingleCategory()
                Spacer()
                SingleCategory()
                space
            }.padding(.all, 10)
            
            HStack {
                space
                SingleCategory()
                Spacer()
                SingleCategory()
                Spacer()
                SingleCategory()
                space
            }.padding(.all, 10)
        }
        .background(Color.init(teal))
    }
}

struct Categories_Previews: PreviewProvider {
    static var previews: some View {
        Categories()
    }
}
