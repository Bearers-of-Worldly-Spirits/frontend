//
//  ComponentData.swift
//  OpenTax
//
//  Created by Josh Arnold on 1/27/21.
//

import UIKit


protocol ComponentBased {
    var data:ComponentData {get set}
}

struct ComponentData : Hashable {
    var text:String?
    var image:UIImage?
}
