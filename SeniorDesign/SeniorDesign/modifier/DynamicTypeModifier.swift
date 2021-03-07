//
//  Accessibility.swift
//  AccessibilityDemo
//
//  Created by Josh Arnold on 3/4/21.
//

import Foundation
import SwiftUI


struct ScaledFont: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory
    var name: String
    var size: CGFloat
    var maxSize:CGFloat = 999.0

    func body(content: Content) -> some View {
        let scaledSize = UIFontMetrics.default.scaledValue(for: size)
        return content.font(.custom(name, size: min(scaledSize, maxSize)))
    }
}


@available(iOS 13, macCatalyst 13, tvOS 13, watchOS 6, *)
extension View {
    func scaledFont(size: CGFloat, name: String = Theme.font.regular, max:CGFloat = 999.0) -> some View {
        return self.modifier(ScaledFont(name: name, size: size, maxSize: max))
    }
}
