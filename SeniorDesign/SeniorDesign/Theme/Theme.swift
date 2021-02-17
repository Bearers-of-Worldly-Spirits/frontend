//
//  SizeGuide.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 2/13/21.
//

import Foundation
import SwiftUI


struct Theme {
    static let pdfAPIEndPoint:String = "https://bows-tax-app.herokuapp.com/"
    
    static let maxScreenWidth:CGFloat = min(320, min(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height))
    static let cornerRadius:CGFloat = 8
    static let lineWidth:CGFloat = 4
    
    static let primaryColor:Color = Color("Primary")
    
    static let fontName:String = "Avenir Next"
}
