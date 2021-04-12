//
//  Form8843.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 2/16/21.
//

import SwiftUI


enum Form8843View {
    case info
    case address
    case extendedInfo
    case visaStatus
    case daysPresent
    case submit
}


struct Form8843: View {
    
    @EnvironmentObject var userState:AppState
    @State private var currentView:Form8843View = .info
    
    
    var body: some View {
        ZStack {
            switch currentView {
            
                case .info:
                    
                    InfoView(formNumber: "8843", description: TaxFormDescriptions.form8843) {
                        withAnimation { currentView = .address }
                    } canceled: {
                        userState.currentScreen = .home
                    }
                            
                case .address:
                    AddressView {
                        withAnimation { currentView = .info }
                    } next: {
                        withAnimation { currentView = .extendedInfo }
                    }
                    
                case .extendedInfo:
                    ExtendedInfoView {
                        withAnimation { currentView = .address }
                    } next: {
                        withAnimation { currentView = .visaStatus }
                    }
                    
                case .visaStatus:
                    VisaStatusView {
                        withAnimation { currentView = .extendedInfo }
                    } next: {
                        withAnimation { currentView = .daysPresent }
                    }
                    
                case .daysPresent:
                    DaysPresentView {
                        withAnimation { currentView = .visaStatus }
                    } next: {
                        withAnimation { currentView = .submit }
                    }
                    
                case .submit:
                    SubmitView {
                        userState.currentScreen = .home
                    }
            }
        }
        .background(Color("Background").ignoresSafeArea())
    }
}

struct Form8843_Previews: PreviewProvider {
    static var previews: some View {
        Form8843()
    }
}
