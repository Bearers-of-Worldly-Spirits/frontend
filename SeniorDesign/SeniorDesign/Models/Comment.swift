//
//  Comment.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 3/10/21.
//

import Foundation
import Parse


struct Comment : Hashable {
    var username:String
    var text:String
    var date:Date
    var object:PFObject
}
