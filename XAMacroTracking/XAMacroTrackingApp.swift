//
//  XAMacroTrackingApp.swift
//  XAMacroTracking
//
//  Created by Alejandro  Salinas Ramirez on 17/08/25.
//

import SwiftUI


@main
struct XAMacroTrackingApp: App {
    
    // instancias
    @StateObject private var userDataVM = UserDataViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userDataVM)
        }
    }
}
