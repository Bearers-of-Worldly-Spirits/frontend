//
//  ExtendedInfoView.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 2/16/21.
//

import SwiftUI
import Parse

struct ExtendedInfoView: View {
    
    var prev: () -> ()
    var next: () -> ()
    
    @State private var phone:String = ""
    @State private var ssn:String = ""
    @State private var dob:Date = Date()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                
                NextPrevBar(title: "About You", next: {
                    setUserValues()
                    next()
                }, prev: {
                    setUserValues()
                    prev()
                })
                                                
                SimpleTextfield(text: $phone, placeholder: "Phone", secure: false)
                SimpleTextfield(text: $ssn, placeholder: "SSN", secure: false)
                
                DatePicker("Date of Birth", selection: $dob, displayedComponents: .date)
                    .padding()
                    .frame(maxWidth: Theme.maxScreenWidth)
                    .foregroundColor(Color(.tertiaryLabel))
                    .accentColor(Color("Primary"))
                                
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
        user["phone"] = phone
        user["ssn"] = ssn
        user["dob"] = dob
        user.saveInBackground()
    }
    
    func loadUserValues() {
        guard PFUser.current() != nil else {return}
        let user = PFUser.current()!
        phone = user["phone"] as? String ?? ""
        ssn = user["ssn"] as? String ?? ""
        dob = user["dob"] as? Date ?? Date()
    }
}

struct ExtendedInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ExtendedInfoView {
            
        } next: {
            
        }
    }
}
