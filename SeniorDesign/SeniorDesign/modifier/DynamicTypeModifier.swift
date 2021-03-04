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
    
    var extraSmall:CGFloat = 8
    var small:CGFloat = 10
    var medium:CGFloat = 12
    var large:CGFloat = 14
    var extraLarge:CGFloat = 16
    var extraExtraLarge:CGFloat = 18
    var extraExtraExtraLarge:CGFloat = 20
    var accessibilityMedium:CGFloat = 22
    var accessibilityLarge:CGFloat = 24
    var accessibilityExtraLarge:CGFloat = 26
    var accessibilityExtraExtraLarge:CGFloat = 28
    var accessibilityExtraExtraExtraLarge:CGFloat = 30

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
