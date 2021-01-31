//
//  FormLibraryData.swift
//  OpenTax
//
//  Created by Josh Arnold on 1/17/21.
//

import UIKit


enum LibrarySectionType {
    case inProgress, complete
}


struct LibrarySection : Hashable {
    var type:LibrarySectionType    
}


struct LibraryRow : Hashable {
    var text:String
    var image:UIImage
    var percent:Double
    var form:Form
}


struct Form : Hashable {}
