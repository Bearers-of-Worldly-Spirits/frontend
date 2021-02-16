//
//  SizeGuide.swift
//  OpenTax
//
//  Created by Josh Arnold on 2/13/21.
//

import Foundation
import UIKit
import SwiftUI


struct SizeGuide {
    static let maxScreenWidth:CGFloat = 250
    static let cornerRadius:CGFloat = 8
    static let lineWidth:CGFloat = 4
}


extension Font {
    static let customBody:Font = Font.custom("Avenir Next", size: 16, relativeTo: .body).weight(.bold)
    
    static let customCaption:Font = Font.custom("Avenir Next", size: 16, relativeTo: .body).weight(.medium)
}
