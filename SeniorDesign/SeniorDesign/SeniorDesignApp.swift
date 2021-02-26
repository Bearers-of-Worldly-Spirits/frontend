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
            $0.applicationId = "QhZnfGAwAZoLpzkq6QFZUQvIqmHTBJAzMtHpahkJ"
            $0.clientKey = "vpqQNJ4FHBktCdeWe4JJ4QnELY2nfozNJFCN61ek"
            $0.server = "https://parseapi.back4app.com/"
        }
        Parse.initialize(with: parseConfig)
    }
}
