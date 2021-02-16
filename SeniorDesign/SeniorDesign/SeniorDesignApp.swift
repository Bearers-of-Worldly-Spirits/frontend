//
//  SeniorDesignApp.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 2/13/21.
//

import SwiftUI
import Parse


@main
class SeniorDesignApp: App {
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
                
    required init() {
        let parseConfig = ParseClientConfiguration {
            $0.applicationId = "myAppId"
            $0.clientKey = "parseClientKey"
            $0.server = "http://localhost:1337/parse"
        }
        Parse.initialize(with: parseConfig)
    }
}
