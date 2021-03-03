//
//  User.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 2/15/21.
//

import Foundation
import SwiftUI
import Combine


enum AuthenticationType {
    case yes, no, unknown
}

class AppState : ObservableObject {
    @Published var authenticated:AuthenticationType = .unknown
    @Published var isLoading:Bool = false
    @Published var isShowingAlert:Bool = false
    @Published var alertMessage:String = ""
}
