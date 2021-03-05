//
//  Accessibility.swift
//  AccessibilityDemo
//
//  Created by Josh Arnold on 3/4/21.
//

import Foundation
import SwiftUI


struct LinearDynamicTypeModifier: ViewModifier {
    
    @Environment(\.sizeCategory) var sizeCategory
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var minSize:CGFloat = 12.0
    var maxSize:CGFloat? = 100.0
    var stepSize:CGFloat = 1.0
    var scaleFactor:CGFloat = 1.0
    var nonCompactScaleFactor:CGFloat = 1.5
    
    var weight:Font.Weight = .regular
    var design:Font.Design = .default
    
    func body(content: Content) -> some View {
        
        var scaledSize:CGFloat = 0.0
                        
        switch sizeCategory {
            case .extraSmall:
                scaledSize = 1.0
            case .small:
                scaledSize = 1*stepSize
            case .medium:
                scaledSize = 2*stepSize
            case .large:
                scaledSize = 3*stepSize
            case .extraLarge:
                scaledSize = 4*stepSize
            case .extraExtraLarge:
                scaledSize = 5*stepSize
            case .extraExtraExtraLarge:
                scaledSize = 6*stepSize
            case .accessibilityMedium:
                scaledSize = 7*stepSize
            case .accessibilityLarge:
                scaledSize = 8*stepSize
            case .accessibilityExtraLarge:
                scaledSize = 9*stepSize
            case .accessibilityExtraExtraLarge:
                scaledSize = 10*stepSize
            case .accessibilityExtraExtraExtraLarge:
                scaledSize = 11*stepSize
            @unknown default:
                scaledSize =  0.0
        }
        
        scaledSize += minSize
        scaledSize *= scaleFactor
        
        if verticalSizeClass == .regular && horizontalSizeClass == .regular {
            scaledSize = scaledSize*nonCompactScaleFactor
        }
        
        if maxSize != nil {
            scaledSize = min(maxSize!, scaledSize)
        }
                        
        //MARK: Define custom font here!
        return content.font(Font.system(size: scaledSize, weight: weight, design: design))
    }
}


@available(iOS 13, macCatalyst 13, tvOS 13, watchOS 6, *)
extension View {
    
    //MARK: Define custom initial values here
    func dynamicFont(
        min:CGFloat, max:CGFloat = 100.0, step:CGFloat = 1.0, scale:CGFloat = 1.0, nonCompactScale:CGFloat = 1.5,
        weight:Font.Weight = .regular,
        design:Font.Design = .default
    ) -> some View {
        self.modifier(
            LinearDynamicTypeModifier(
                minSize: min, maxSize: max, stepSize: step, scaleFactor: scale, nonCompactScaleFactor: nonCompactScale,
                weight: weight, design: design
            )
        )
    }
}


/*
 // A neat preview
 struct ContentView_Previews: PreviewProvider {
     static var previews: some View {
         
         ForEach([ContentSizeCategory.extraSmall, ContentSizeCategory.accessibilityExtraExtraExtraLarge], id: \.self) { size in
             Group {
                 ContentView()
                     .previewDevice("iPhone SE (2nd generation)")
                 ContentView()
                     .previewDevice("iPad Pro (12.9-inch) (4th generation)")
             }
             .environment(\.sizeCategory, size)
         }
     }
 }
 */
