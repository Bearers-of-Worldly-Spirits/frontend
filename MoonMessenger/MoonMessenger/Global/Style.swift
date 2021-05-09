//
//  Style.swift
//  MoonMessenger
//
//  Created by Josh Arnold on 5/9/21.
//

import UIKit


extension UIColor {
    static var background:UIColor {
        return UIColor(red: 0.12, green: 0.13, blue: 0.16, alpha: 1.00)        
    }
}


extension UILabel {
    
    
     static func title() -> UILabel {
        let label = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFontMetrics(forTextStyle: .title1).scaledFont(for: UIFont(name: "Pacifico-Regular", size: 40) ?? UIFont.systemFont(ofSize: UIFont.labelFontSize))
        label.textColor = .white
        label.text = "Hello world."
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }
    
    static func body() -> UILabel {
        let label = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: UIFont(name: "Pacifico-Regular", size: 16) ?? UIFont.systemFont(ofSize: UIFont.labelFontSize))
        label.textColor = .white
        label.text = "This is a body label! Cool, huh?"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.alpha = 0.5
        return label
    }
}
