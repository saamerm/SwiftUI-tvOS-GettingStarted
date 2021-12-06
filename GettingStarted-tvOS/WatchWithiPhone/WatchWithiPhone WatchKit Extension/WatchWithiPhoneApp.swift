//
//  WatchWithiPhoneApp.swift
//  WatchWithiPhone WatchKit Extension
//
//  Created by Saamer Mansoor on 11/30/21.
//

import SwiftUI

@main
struct WatchWithiPhoneApp: App {
    
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
