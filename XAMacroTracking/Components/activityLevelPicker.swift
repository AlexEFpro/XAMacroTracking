//
//  activityLevelPicker.swift
//  XAMacroTracking
//
//  Created by Alejandro  Salinas Ramirez on 06/10/25.
//

import SwiftUI

struct activityLevelPicker: View {
    @EnvironmentObject var userDataVM: UserDataViewModel
    @EnvironmentObject var macroDistributionVM: MacroDistributionVM
    @EnvironmentObject var languageManager: LanguageManager
    var body: some View{
        
        Picker(AppTextVm.activityLevel.localized(for: languageManager.currentLanguage),selection: $userDataVM.activityLevel ){
            ForEach(UserDataViewModel.ActivityLevel.allCases, id: \.self){level in Text(level.localized(for: languageManager.currentLanguage)).tag(level)
                
            }
        }
        .padding()
    }
}
#Preview {
    let userDataVM = UserDataViewModel()
    let macroDistributionVM = MacroDistributionVM(userDataVm: userDataVM)
    let languageManager = LanguageManager()
    activityLevelPicker()
        .environmentObject(userDataVM)
        .environmentObject(macroDistributionVM)
        .environmentObject(languageManager)
    
}
