//
//  calculateButton.swift
//  XAMacroTracking
//
//  Created by Alejandro  Salinas Ramirez on 06/10/25.
//

import SwiftUI

struct calculateButton: View {
    @EnvironmentObject var userDataVM: UserDataViewModel
    @EnvironmentObject var macroDistributionVM: MacroDistributionVM
    @EnvironmentObject var languageManager: LanguageManager
    var body: some View {
        
        Button(AppTextVm.calculateButton.localized(for: languageManager.currentLanguage)){
            userDataVM.goToSheet = true;
            //userDataVM.gastoBasal();
            macroDistributionVM.allCalculations()
        }
        .font(.title3.bold())
        .frame(maxWidth:.infinity)
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
    }
}

#Preview {
    let userDataVM = UserDataViewModel()
    let macroDistributionVM = MacroDistributionVM(userDataVm: userDataVM)
    let languageManager = LanguageManager()
    calculateButton()
        .environmentObject(userDataVM)
        .environmentObject(macroDistributionVM)
        .environmentObject(languageManager)
}
