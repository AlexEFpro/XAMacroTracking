//
//  heightSlider.swift
//  XAMacroTracking
//
//  Created by Alejandro  Salinas Ramirez on 02/10/25.
//

import SwiftUI

struct heightSlider: View {
    @EnvironmentObject var userDataVM: UserDataViewModel
    @EnvironmentObject var macroDistributionVM: MacroDistributionVM
    @EnvironmentObject var languageManager: LanguageManager
    
    var body: some View {
        Slider( value: $userDataVM.height, in: 130...230, step: 0.1)
        Text(AppTextVm.height.localized(for: languageManager.currentLanguage)+":") + Text("\(userDataVM.height, specifier: "%.1f") \(AppTextVm.heightUnit.localized(for: languageManager.currentLanguage))")
            .font(.headline .bold())
    }
}

#Preview {
    let userDataVM = UserDataViewModel()
    let macroDistributionVM = MacroDistributionVM(userDataVm: userDataVM)
    let languageManger = LanguageManager()
    heightSlider()
        .environmentObject(userDataVM)
        .environmentObject(macroDistributionVM)
        .environmentObject(languageManger)
}
