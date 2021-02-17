//
//  DaysPresentView.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 2/16/21.
//

import SwiftUI
import Parse


struct DaysPresentView: View {
    
    var prev: () -> ()
    var next: () -> ()
    
    @State private var days2020:String = ""
    @State private var days2019:String = ""
    @State private var days2018:String = ""
    @State private var filedBefore:Bool = false
    
    var body: some View {
                
        ScrollView {
            VStack(spacing: 0) {
                
                NextPrevBar(title: "Presence", next: {
                    setUserValues()
                    next()
                }, prev: {
                    setUserValues()
                    prev()
                })
                
                Text("Please list the days you were present in the U.S.A during the following years.")
                    .multilineTextAlignment(.center)
                    .font(Font.custom(Theme.fontName, size: 16).weight(.medium))
                    .foregroundColor(Color(.secondaryLabel))
                    .padding()
                    .frame(maxWidth: Theme.maxScreenWidth)
                                                
                SimpleTextfield(text: $days2020, placeholder: "2020", secure: false)
                SimpleTextfield(text: $days2019, placeholder: "2019", secure: false)
                SimpleTextfield(text: $days2018, placeholder: "2018", secure: false)
                           
                Divider()
                
                Toggle("Did you file a U.S income tax return any prior year?", isOn: $filedBefore)
                    .font(Font.custom(Theme.fontName, size: 16).weight(.medium))
                    .toggleStyle(SwitchToggleStyle(tint: Color("Primary")))
                    .foregroundColor(Color(.secondaryLabel))
                    .padding()
                    .frame(maxWidth: Theme.maxScreenWidth)
                
                Spacer()
            }
        }
        .background(Color("Background").ignoresSafeArea())
        .onAppear() {
            loadUserValues()
        }
    }
    
    func setUserValues() {
        guard PFUser.current() != nil else {return}
        let user = PFUser.current()!
        user["daysPresent2020"] = days2020
        user["daysPresent2019"] = days2019
        user["daysPresent2018"] = days2018
        user["previouslyFiledTaxForm"] = filedBefore
        user.saveInBackground()
    }
    
    func loadUserValues() {
        guard PFUser.current() != nil else {return}
        let user = PFUser.current()!
        days2020 = user["daysPresent2020"] as? String ?? ""
        days2019 = user["daysPresent2019"] as? String ?? ""
        days2018 = user["daysPresent2018"] as? String ?? ""
        filedBefore = user["previouslyFiledTaxForm"] as? Bool ?? false
    }
}

struct DaysPresentView_Previews: PreviewProvider {
    static var previews: some View {
        DaysPresentView {
            
        } next: {
            
        }

    }
}
