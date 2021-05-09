//
//  UserData.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 4/28/21.
//

import Foundation
import UIKit
import KeychainAccess
import Parse


/**
 * Given a key, it will automatically save to user-defaults.
 * Automatically tries to use the Parse user's email address to prevent cross-contamination of sensetive data.
 */
@propertyWrapper
struct Privacy {
    
    private var key:String = ""
    private var value:String = ""
    
    init(wrappedValue:String, key:String) {
        value = wrappedValue
        self.key=key
    }
    
    var wrappedValue:String {
        get {
            getValue()
        }
        set {
            saveValue(newValue: newValue)
        }
    }
    
    private func getID() -> String {
        return "\(PFUser.current()?.email ?? UUID().uuidString)-\(key)"
    }
    
    
    private func getValue() -> String {
        let keychain = Keychain(service: "com.melon.\(key)")
        return keychain[getID()] ?? ""
    }
    
    private mutating func saveValue(newValue:String) {
        value = newValue
        let keychain = Keychain(service: "com.melon.\(key)")
        keychain[getID()] = value
    }
}


struct UserData {
    
    static var shared:UserData = UserData()
    
    @Privacy(key: "street") var street:String = ""
    @Privacy(key: "apartment") var apartment:String = ""
    @Privacy(key: "city") var city:String = ""
    @Privacy(key: "state") var state:String = ""
    @Privacy(key: "zipCode") var zipCode:String = ""
    
    @Privacy(key: "phone") var phone:String = ""
    @Privacy(key: "ssn") var ssn:String = ""
    @Privacy(key: "dob") var dob:String = ""
    
    @Privacy(key: "visa") var visa:String = ""
    @Privacy(key: "passportNumber") var passportNumber:String = ""
    @Privacy(key: "citizenship") var countryOfCitizenship:String = ""
    
    @Privacy(key: "days2020") var days2020:String = ""
    @Privacy(key: "days2019") var days2019:String = ""
    @Privacy(key: "days2018") var days2018:String = ""
}
