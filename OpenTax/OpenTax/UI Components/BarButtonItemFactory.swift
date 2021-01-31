//
//  BarButtonItemFactory.swift
//  OpenTax
//
//  Created by Josh Arnold on 1/30/21.
//

import UIKit


class BarButtonItemFactory {
    static func basic() -> UIBarButtonItem {
        let backButton = UIButton(type: .custom)
        backButton.frame = CGRect(x:0,y:0,width: 45, height:45)
        backButton.setTitle("Next", for: .normal)
        backButton.setTitleColor(.primary, for: .normal)
        backButton.setTitleColor(.tertiaryLabel, for: .highlighted)
        let backBarButtonItem = UIBarButtonItem.init(customView: backButton)
        return backBarButtonItem
    }
}
