//
//  User.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 2/15/21.
//

import Foundation
import SwiftUI
import Combine


enum AppView: Identifiable {
    case unknown, splash, login, signup, home, form8843, discussion, createPost, post, flappyTax
    var id: Int { hashValue }
}


class AppState : ObservableObject {
    @Published var currentScreen:AppView = AppView.unknown
    @Published var isLoading:Bool = false
    @Published var isShowingAlert:Bool = false
    @Published var alertMessage:String = ""
    @Published var recentPost:Post = Post(object: nil, title: "", description: "")
}
