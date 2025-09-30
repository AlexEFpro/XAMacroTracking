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
    @StateObject private var userDataVM : UserDataViewModel
    @StateObject private var macroDistributionVM : MacroDistributionVM
    init() {
            let userData = UserDataViewModel()
            _userDataVM = StateObject(wrappedValue: userData)
            _macroDistributionVM = StateObject(wrappedValue: MacroDistributionVM(userDataVm: userData))
        }
   
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userDataVM)
                .environmentObject(macroDistributionVM)
        }
    }
}
