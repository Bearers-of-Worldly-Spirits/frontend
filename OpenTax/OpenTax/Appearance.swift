//
//  Appearance.swift
//  OpenTax
//
//  Created by Josh Arnold on 1/25/21.
//

import UIKit
import SwiftUI


extension UIColor {
    static var primary:UIColor {
        return UIColor(red: 0.23, green: 0.89, blue: 0.65, alpha: 1.00)
        

    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
