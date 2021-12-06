//
//  WatchWithiPhoneApp.swift
//  WatchWithiPhone WatchKit Extension
//
//  Created by Saamer Mansoor on 11/30/21.
//

import SwiftUI

@main
struct WatchWithiPhoneApp: App {
    @State private var notification: CustomNotification? = CustomNotification(text: "LOL", isPriority: true)
    
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView(notification: $notification)
            }
        }

    }
}
