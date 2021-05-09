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
    
    @State private var days2020:String = UserData.shared.days2020
    @State private var days2019:String = UserData.shared.days2019
    @State private var days2018:String = UserData.shared.days2018
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
                
                LottieView(name: "pin", speed: 0.7)
                    .frame(maxWidth: 150)
                    .frame(height: 90)
                
                Text("Please list the days you were present in the U.S.A during the following years.")
                    .multilineTextAlignment(.center)
                    .scaledFont(size: 16, name: Theme.font.medium)
                    .foregroundColor(Color(.secondaryLabel))
                    .padding()
                    .frame(maxWidth: Theme.maxScreenWidth)
                                                
                SimpleTextfield(text: $days2020, placeholder: "2020", secure: false)
                SimpleTextfield(text: $days2019, placeholder: "2019", secure: false)
                SimpleTextfield(text: $days2018, placeholder: "2018", secure: false)
                           
                Divider()
                
                Toggle("Did you file a U.S income tax return any prior year?", isOn: $filedBefore)
                    .scaledFont(size: 16, name: Theme.font.medium)
                    .toggleStyle(SwitchToggleStyle(tint: Color("Primary")))
                    .foregroundColor(Color(.secondaryLabel))
                    .padding()
                    .frame(maxWidth: Theme.maxScreenWidth)
                
                Spacer()
            }
        }
        .background(Color("Background").ignoresSafeArea())
        .onTapGesture { UIApplication.shared.endEditing() }
    }
    
    func setUserValues() {
        guard PFUser.current() != nil else {return}
        UserData.shared.days2020 = days2020
        UserData.shared.days2019 = days2019
        UserData.shared.days2018 = days2018
    }
}

struct DaysPresentView_Previews: PreviewProvider {
    static var previews: some View {
        DaysPresentView {
            
        } next: {
            
        }

    }
}
