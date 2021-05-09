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
            street: UserData.shared.street,
            apt: UserData.shared.apartment,
            city: UserData.shared.city,
            state: UserData.shared.state,
            zipCode: UserData.shared.zipCode,
            phone: UserData.shared.phone,
            ssn: UserData.shared.ssn,
            dob: Date(), // TODO: Update this line!
            visa: UserData.shared.visa,
            passportNumber: UserData.shared.passportNumber,
            countryOfCitizenship: UserData.shared.countryOfCitizenship,
            days2020: UserData.shared.days2020,
            days2019: UserData.shared.days2019,
            days2018: UserData.shared.days2018,
            filedBefore: false // TODO: Update !this
        )
    }
}
