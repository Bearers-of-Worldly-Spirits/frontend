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
    
    @State private var visa:String = UserData.shared.visa
    @State private var passportNumber:String = UserData.shared.passportNumber
    @State private var countryOfCitizenship:String = UserData.shared.countryOfCitizenship
    
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
        .onTapGesture { UIApplication.shared.endEditing() }
    }
    
    func setUserValues() {
        guard PFUser.current() != nil else {return}        
        UserData.shared.visa = visa
        UserData.shared.passportNumber = passportNumber
        UserData.shared.countryOfCitizenship = countryOfCitizenship
    }
}

struct VisaStatusView_Previews: PreviewProvider {
    static var previews: some View {
        VisaStatusView {
            
        } next: {
            
        }

    }
}
