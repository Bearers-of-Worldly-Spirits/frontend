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
    
    @ObservedObject private var appState:AppState = AppState()
            
    var body: some Scene {
        WindowGroup {
            ZStack {
                Group {
                    switch appState.currentScreen {
                        case .splash:
                            SplashView()
                        case .login:
                            LoginView()
                        case .signup:
                            SignupView()
                        case .home:
                            HomeView()
                        case .form8843:
                            Form8843()
                        case .discussion:
                            DiscussionView()
                        case .createPost:
                            CreatePostView()
                        case .post:
                            PostView()
                        case .unknown:
                            EmptyView()
                    }
                }
                .transition(AnyTransition.scale.animation(.easeInOut(duration: 0.35)))
                .alert(isPresented: $appState.isShowingAlert) {
                    Alert(title:
                            Text("Uh Oh."),
                          message:
                            Text(appState.alertMessage),
                          dismissButton: .default(Text("Got it!"))
                    )
                }                
                if appState.isLoading == true {
                    LoadingScreen(isLoading: .constant(appState.isLoading))
                }
            }
            .environmentObject(appState)
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
                appState.currentScreen = .home
            }else{
                appState.currentScreen = .splash
            }
        }
    }
}
