//
//  Post.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 3/6/21.
//

import Foundation
import SwiftUI
import Parse


struct Post : Hashable {
    var object:PFObject?
    var title:String
    var description:String
}
