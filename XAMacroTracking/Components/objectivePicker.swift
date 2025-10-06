//
//  objectivePicker.swift
//  XAMacroTracking
//
//  Created by Alejandro  Salinas Ramirez on 06/10/25.
//

import SwiftUI

struct objectivePicker: View {
    @EnvironmentObject var userDataVM: UserDataViewModel
    @EnvironmentObject var languageManager: LanguageManager
    @EnvironmentObject var macroDistributionVM: MacroDistributionVM
    var body: some View {
        
        Picker(AppTextVm.objective.localized(for: languageManager.currentLanguage),selection: $userDataVM.objective ){
            ForEach(UserDataViewModel.Objective.allCases, id: \.self){ objective in Text(objective.localixed(for: languageManager.currentLanguage)).tag(objective)
                
            }
        }
    }
}

#Preview {
    let userDataVM = UserDataViewModel()
    let languageManager = LanguageManager()
    let macroDistributionVM = MacroDistributionVM(userDataVm: userDataVM)

    objectivePicker()
        .environmentObject(userDataVM)
        .environmentObject(languageManager)
        .environmentObject(macroDistributionVM)
    
}
