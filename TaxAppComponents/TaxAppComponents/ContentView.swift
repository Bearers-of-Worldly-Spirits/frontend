//
//  ContentView.swift
//  TaxAppComponents
//
//  Created by Shreya on 3/5/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // Replace teal with gradients
        let teal = UIColor(red: 0.0549, green: 0.9137, blue: 0.8902, alpha: 1.0);
        
        CreateNewPost().background(Color.init(teal))
        //ViewProfilePage().background(Color.init(teal))
//        SearchCategories().background(Color.init(teal))
//        SearchPosts().background(Color.init(teal))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
