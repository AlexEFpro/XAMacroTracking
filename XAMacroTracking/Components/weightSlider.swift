//
//  weightSlider.swift
//  XAMacroTracking
//
//  Created by Alejandro  Salinas Ramirez on 02/10/25.
//

import SwiftUI

struct weightSlider: View {
    @EnvironmentObject var userDataVM: UserDataViewModel
    @EnvironmentObject var macroDistributionVM: MacroDistributionVM
    @EnvironmentObject var languageManager: LanguageManager
    var body: some View {
        Slider(value: $userDataVM.weight, in: 30...200.0, step: 0.1)
            .padding()
        Text(AppTextVm.weight.localized(for: languageManager.currentLanguage)+":") + Text(
            languageManager.currentLanguage.userImperial ? "\(userDataVM.weight.kgToLbs,specifier: "%.1f") \(AppTextVm.weightUnit.localized(for: languageManager.currentLanguage))" : "\(userDataVM.weight,specifier: "%.1f") \(AppTextVm.weightUnit.localized(for: languageManager.currentLanguage))"
        )
            .font(.headline .bold())
    }
}

#Preview {
    let userDataVM = UserDataViewModel()
    let macroDistributionVM = MacroDistributionVM(userDataVm: userDataVM)
    let languageManager = LanguageManager()
    weightSlider()
        .environmentObject(userDataVM)
        .environmentObject(macroDistributionVM)
        .environmentObject(languageManager)
}
