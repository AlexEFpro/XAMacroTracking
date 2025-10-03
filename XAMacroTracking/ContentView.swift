//
//  ContentView.swift
//  XAMacroTracking
//
//  Created by Alejandro  Salinas Ramirez on 17/08/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var languageManager:LanguageManager
    var body: some View {
        VStack(spacing: 8){
            Logo()
                .padding(.top,20)
            LanguageButton()
                .padding(.bottom,12)
            BasicFormView()
                .padding(.horizontal)
               
            
        }
            
       
        
    }
}

#Preview {
    let userDataVM=UserDataViewModel()
    let macroDistributionVM=MacroDistributionVM(userDataVm: userDataVM)
    let languageManger=LanguageManager()
    
    ContentView()
        .environmentObject(userDataVM)
        .environmentObject(macroDistributionVM)
        .environmentObject(languageManger)
}
