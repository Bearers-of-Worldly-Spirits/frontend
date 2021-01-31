//
//  GradientHeader.swift
//  OpenTax
//
//  Created by Josh Arnold on 1/20/21.
//

import UIKit


class ResizableGradientView : UIView {
    
    override public class var layerClass: AnyClass { CAGradientLayer.self }
    
    var gradientLayer: CAGradientLayer { layer as! CAGradientLayer }
    
    var colors:[CGColor] = [] {
        didSet { gradientLayer.colors = colors }
    }
    
    init() {
        super.init(frame: .zero)
        gradientLayer.startPoint = CGPoint(x: 0, y: 1)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
