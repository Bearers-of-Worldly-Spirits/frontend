//
//  Card.swift
//  OpenTax
//
//  Created by Josh Arnold on 1/17/21.
//

import UIKit


class Card : UIView {
    init() {
        super.init(frame: .zero)
        backgroundColor = .systemBackground
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.05
        layer.shadowRadius = 3.0
        layer.shadowOffset = .init(width: 0, height: 4)
        layer.cornerRadius = 9
        layer.cornerCurve = .continuous
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
