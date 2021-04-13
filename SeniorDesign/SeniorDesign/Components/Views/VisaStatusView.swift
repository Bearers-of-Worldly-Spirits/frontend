//
//  VisaStatusView.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 2/16/21.
//

import SwiftUI
import Parse


struct VisaStatusView: View {
    
    var prev: () -> ()
    var next: () -> ()
    
    @State private var visa:String = ""
    @State private var passportNumber:String = ""
    @State private var countryOfCitizenship:String = ""
    
    var body: some View {
                
        ScrollView {
            VStack(spacing: 0) {
                
                NextPrevBar(title: "Visa Status", next: {
                    setUserValues()
                    next()
                }, prev: {
                    setUserValues()
                    prev()
                })
                                       
                LottieView(name: "cards", speed: 0.3)
                    .frame(maxWidth: 150)
                    .frame(height: 90)
                
                SimpleTextfield(text: $countryOfCitizenship, systemImageName: "mappin", placeholder: "Country of citizenship", secure: false)
                SimpleTextfield(text: $passportNumber, systemImageName: "number", placeholder: "Passport #", secure: false)
                SimpleTextfield(text: $visa, systemImageName: "creditcard.fill", placeholder: "Visa e.g F1, H-1B", secure: false)
                                
                Spacer()
            }
        }
        .background(Color("Background").ignoresSafeArea())
        .onAppear() {
            loadUserValues()
        }
        .onTapGesture { UIApplication.shared.endEditing() }
    }
    
    func setUserValues() {
        guard PFUser.current() != nil else {return}
        let user = PFUser.current()!
        user["visa"] = visa
        user["passportNumber"] = passportNumber
        user["countryOfCitizenship"] = countryOfCitizenship
        user.saveInBackground()
    }
    
    func loadUserValues() {
        guard PFUser.current() != nil else {return}
        let user = PFUser.current()!
        visa = user["visa"] as? String ?? ""
        passportNumber = user["passportNumber"] as? String ?? ""
        countryOfCitizenship = user["countryOfCitizenship"] as? String ?? ""
    }
}

struct VisaStatusView_Previews: PreviewProvider {
    static var previews: some View {
        VisaStatusView {
            
        } next: {
            
        }

    }
}
