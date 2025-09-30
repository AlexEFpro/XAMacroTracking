//
//  ContentView.swift
//  XAMacroTracking
//
//  Created by Alejandro  Salinas Ramirez on 17/08/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
    Logo()
    BasicForm()
            .padding(.horizontal)
            
    }
}

#Preview {
    let userDataVM=UserDataViewModel()
    let macroDistributionVM=MacroDistributionVM(userDataVm: userDataVM)
    
    ContentView()
        .environmentObject(userDataVM)
        .environmentObject(macroDistributionVM)
}
