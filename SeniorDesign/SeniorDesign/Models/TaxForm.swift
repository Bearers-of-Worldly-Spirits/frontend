//
//  TaxForm.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 2/16/21.
//

import Foundation
import SwiftUI
import Parse


struct TaxForm : Identifiable {
    var id: UUID = UUID()
    var name:String
}


struct TaxFormDescriptions {
    static let form8843:String = """
    This form is a statement filed by non-resident aliens for the government, for specific tax purposes. You must file a Form 8843 if:\n\n \
    1) you were present in the US in the previous tax year\n\n \
    2) you are a non-resident alien\n\n \
    3) and you are in the US under F-1, J-1, F-2 or J-2 status.
    """
}


struct Form8843Data : Encodable {
    
    var name:String?
    var email:String?    
    var street:String?
    var apt:String?
    var city:String?
    var state:String?
    var zipCode:String?
    var phone:String?
    var ssn:String?
    var dob:Date?
    var visa:String?
    var passportNumber:String?
    var countryOfCitizenship:String?
    var days2020:String?
    var days2019:String?
    var days2018:String?
    var filedBefore:Bool?
    
}


class FormCompiler {
    
    static func form8843() -> Form8843Data {
        guard PFUser.current() != nil else {return Form8843Data()}
        let user = PFUser.current()!
        return Form8843Data(
            name: user.object(forKey: "name") as? String,
            email: user.email,
            street: user.object(forKey: "Street") as? String,
            apt: user.object(forKey: "apt") as? String,
            city: user.object(forKey: "city") as? String,
            state: user.object(forKey: "state") as? String,
            zipCode: user.object(forKey: "zipCode") as? String,
            phone: user.object(forKey: "phone") as? String,
            ssn: user.object(forKey: "ssn") as? String,
            dob: user.object(forKey: "dob") as? Date,
            visa: user.object(forKey: "visa") as? String,
            passportNumber: user.object(forKey: "passportNumber") as? String,
            countryOfCitizenship: user.object(forKey: "countryOfCitizenship") as? String,
            days2020: user.object(forKey: "daysPresent2020") as? String,
            days2019: user.object(forKey: "daysPresent2019") as? String,
            days2018: user.object(forKey: "daysPresent2018") as? String,
            filedBefore: user.object(forKey: "previouslyFiledTaxForm") as? Bool)
    }
}
