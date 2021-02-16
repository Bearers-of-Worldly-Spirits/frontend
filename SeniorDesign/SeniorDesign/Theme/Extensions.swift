//
//  Extensions.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 2/13/21.
//

import Foundation
import UIKit
import SwiftUI


extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
