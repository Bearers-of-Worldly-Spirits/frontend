//
//  AddressView.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 2/16/21.
//

import SwiftUI
import Parse


struct AddressView: View {
    
    var prev: () -> ()
    var next: () -> ()
    
    @State private var street:String = ""
    @State private var apt:String = ""
    @State private var city:String = ""
    @State private var state:String = ""
    @State private var zipCode:String = ""
    
    var body: some View {
                
        ScrollView {
            VStack(spacing: 0) {
                
                NextPrevBar(title: "Address", next: {
                    setUserValues()
                    next()
                }, prev: {
                    setUserValues()
                    prev()
                })
                                                
                SimpleTextfield(text: $street, placeholder: "Street", secure: false)
                SimpleTextfield(text: $apt, placeholder: "Apt Number", secure: false)
                SimpleTextfield(text: $city, placeholder: "City", secure: false)
                SimpleTextfield(text: $state, placeholder: "State", secure: false)
                SimpleTextfield(text: $zipCode, placeholder: "Zip", secure: false)
                                
                Spacer()                                
            }
        }
        .background(Color("Background").ignoresSafeArea())
        .onAppear() {
            loadUserValues()
        }
    }
    
    private func loadUserValues() {
        guard PFUser.current() != nil else {return}
        let user = PFUser.current()!
        street = user["street"] as? String ?? ""
        apt = user["apt"] as? String ?? ""
        city = user["city"] as? String ?? ""
        state = user["state"] as? String ?? ""
        zipCode = user["zipCode"] as? String ?? ""
    }
    
    private func setUserValues() {
        guard PFUser.current() != nil else {return}
        let user = PFUser.current()!
        user["street"] = street
        user["apt"] = apt
        user["city"] = city
        user["state"] = state
        user["zipCode"] = zipCode
        user.saveInBackground()        
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView {
            
        } next: {
            
        }

    }
}
