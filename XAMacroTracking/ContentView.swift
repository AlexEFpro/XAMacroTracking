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
            .padding()
            
    }
}

#Preview {
    let userDataVM=UserDataViewModel()
    ContentView()
        .environmentObject(userDataVM)
}
