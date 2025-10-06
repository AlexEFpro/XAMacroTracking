//
//  agePicker.swift
//  XAMacroTracking
//
//  Created by Alejandro  Salinas Ramirez on 06/10/25.
//

import SwiftUI

struct agePicker: View {
    @EnvironmentObject var userDataVM: UserDataViewModel
    @EnvironmentObject var macroDistributionVM: MacroDistributionVM
    @EnvironmentObject var languageManager: LanguageManager
    var body: some View {
        HStack {
            Picker(AppTextVm.age.localized(for: languageManager.currentLanguage), selection: $userDataVM.age) {
                ForEach(15...100, id: \.self) {
                    Text("\($0)").tag(Double($0))
                }
            }
            .padding()
            Picker(AppTextVm.gender.localized(for: languageManager.currentLanguage), selection: $userDataVM.gender) {
                ForEach(UserDataViewModel.Gender.allCases,id: \.self){gender in
                    Text(gender.localized(for: languageManager.currentLanguage)).tag(gender)
                    
                }
            }
        }
    }
}

#Preview {
    let userDataVM = UserDataViewModel()
    let macroDistributionVM = MacroDistributionVM(userDataVm: userDataVM)
    let languageManager = LanguageManager()
    agePicker()
        .environmentObject(userDataVM)
        .environmentObject(macroDistributionVM)
        .environmentObject(languageManager)
}
