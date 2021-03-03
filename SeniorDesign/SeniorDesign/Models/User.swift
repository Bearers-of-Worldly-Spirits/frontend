//
//  User.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 2/15/21.
//

import Foundation
import SwiftUI
import Combine


enum UserStateType {
    case yes, no, unknown
}

class UserState : ObservableObject {
    @Published var authenticated:UserStateType = .unknown
}
