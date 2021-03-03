//
//  SeniorDesignApp.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 2/13/21.
//

import SwiftUI
import Parse


@main
struct SeniorDesignApp: App {
    
    @ObservedObject private var userState:UserState = UserState()
            
    var body: some Scene {
        WindowGroup {
            Group {
                switch userState.authenticated {
                    case .no:
                        SplashView()
                            .transition(AnyTransition.scale.animation(.easeInOut(duration: 0.35)))
                    case .yes:
                        HomeView()
                            .transition(AnyTransition.scale.animation(.easeInOut(duration: 0.35)))
                    case .unknown:
                        EmptyView()
                }
            }
            .environmentObject(userState)
            .onAppear {
                loadParse()
                checkUserState()
            }
        }
    }
    
    func loadParse() {
        let parseConfig = ParseClientConfiguration {
            $0.applicationId = "QhZnfGAwAZoLpzkq6QFZUQvIqmHTBJAzMtHpahkJ"
            $0.clientKey = "vpqQNJ4FHBktCdeWe4JJ4QnELY2nfozNJFCN61ek"
            $0.server = "https://parseapi.back4app.com/"
        }
        Parse.initialize(with: parseConfig)
    }
    
    func checkUserState() {
        withAnimation {
            if (PFUser.current() != nil) {
                userState.authenticated = .yes
            }else{
                userState.authenticated = .no
            }
        }
    }
}
