//
//  LandMarksApp.swift
//  Shared
//
//  Created by Hur Ali on 1/17/22.
//

import SwiftUI

@main
struct LandMarksApp: App {
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
        #if !os(watchOS)
        .commands {
            LandMarkCommands()
        }
        #endif
        
        #if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif
        
        #if os(macOS)
        Settings {
            LandMarkSettings()
        }
        #endif
    }
}
