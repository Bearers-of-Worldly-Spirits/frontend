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
    
    @State private var street:String    = UserData.shared.street
    @State private var apt:String       = UserData.shared.apartment
    @State private var city:String      = UserData.shared.city
    @State private var state:String     = UserData.shared.state
    @State private var zipCode:String   = UserData.shared.zipCode
    
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
                
                LottieView(name: "address", speed: 0.5)
                    .frame(maxWidth:.infinity)
                    .frame(height: 100)
                                                
                SimpleTextfield(text: $street, systemImageName: "house.fill", placeholder: "Street", secure: false)
                SimpleTextfield(text: $apt, systemImageName: "number", placeholder: "Apt Number", secure: false)
                SimpleTextfield(text: $city, systemImageName: "mappin", placeholder: "City", secure: false)
                SimpleTextfield(text: $state, systemImageName: "mappin.and.ellipse", placeholder: "State", secure: false)
                SimpleTextfield(text: $zipCode, systemImageName: "number", placeholder: "Zip", secure: false)
                                
                Spacer()                                
            }
        }
        .background(Color("Background").ignoresSafeArea())
        .onAppear() {
            loadUserValues()
        }
        .onTapGesture { UIApplication.shared.endEditing() }
    }
    
    private func loadUserValues() {
        guard PFUser.current() != nil else {return}
        street = UserData.shared.street
        apt = UserData.shared.apartment
        city = UserData.shared.city
        state = UserData.shared.state
        zipCode = UserData.shared.zipCode
    }
    
    private func setUserValues() {
        guard PFUser.current() != nil else {return}
        UserData.shared.street = street
        UserData.shared.apartment = apt
        UserData.shared.city = city
        UserData.shared.state = state
        UserData.shared.zipCode = zipCode
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView {
            
        } next: {
            
        }
    }
}
