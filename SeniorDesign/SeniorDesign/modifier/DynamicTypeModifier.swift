//
//  DynamicTypeModifier.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 3/3/21.
//

import SwiftUI


struct DynamicTypeModifier: ViewModifier {
    
    @Environment(\.sizeCategory) var sizeCategory
    var weight: Font.Weight = .regular
    var design: Font.Design = .rounded
    var scale:CGFloat = 1.0
    
    var extraSmall:CGFloat = 12
    var small:CGFloat = 13
    var medium:CGFloat = 14
    var large:CGFloat = 16
    var extraLarge:CGFloat = 18
    var extraExtraLarge:CGFloat = 20
    var extraExtraExtraLarge:CGFloat = 22
    var accessibilityMedium:CGFloat = 24
    var accessibilityLarge:CGFloat = 26
    var accessibilityExtraLarge:CGFloat = 28
    var accessibilityExtraExtraLarge:CGFloat = 30
    var accessibilityExtraExtraExtraLarge:CGFloat = 32

    func body(content: Content) -> some View {
                
        var scaledSize:CGFloat = 0.0
        
        
        
        switch sizeCategory {
            case .extraSmall:
                scaledSize = extraSmall
            case .small:
                scaledSize = small
            case .medium:
                scaledSize = medium
            case .large:
                scaledSize = large
            case .extraLarge:
                scaledSize = extraLarge
            case .extraExtraLarge:
                scaledSize = extraExtraLarge
            case .extraExtraExtraLarge:
                scaledSize = extraExtraExtraLarge
            case .accessibilityMedium:
                scaledSize = accessibilityMedium
            case .accessibilityLarge:
                scaledSize = accessibilityLarge
            case .accessibilityExtraLarge:
                scaledSize = accessibilityExtraLarge
            case .accessibilityExtraExtraLarge:
                scaledSize = accessibilityExtraExtraLarge
            case .accessibilityExtraExtraExtraLarge:
                scaledSize = accessibilityExtraExtraExtraLarge
            @unknown default:
                scaledSize = medium
        }
        
        return content.font(.system(size: scaledSize*scale, weight: weight, design: design))
    }
}


@available(iOS 13, macCatalyst 13, tvOS 13, watchOS 6, *)
extension View {
    
    func dynamicFont(weight:Font.Weight = .medium, scale:CGFloat = 1.0) -> some View {
        self.modifier(DynamicTypeModifier(weight: .medium, design: .rounded, scale: scale))
    }
}
