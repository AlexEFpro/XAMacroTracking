//
//  MacroCard.swift
//  XAMacroTracking
//
//  Created by Alejandro  Salinas Ramirez on 18/08/25.
//

import SwiftUI

struct MacroCard: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var userDataVM: UserDataViewModel
    @EnvironmentObject private var macroDistributionVM: MacroDistributionVM
    @EnvironmentObject private var languageManager: LanguageManager
   
    var body: some View {
        Grid{
            GridRow{
                Text(AppTextVm.energyRequirement.localized(for: languageManager.currentLanguage))
                Text("\(userDataVM.gObjective, specifier: "%.0f") kcal")
            }
            Divider()
            
            GridRow{
                Text(AppTextVm.carbs.localized(for: languageManager.currentLanguage))
                Text("\(macroDistributionVM.carbsPortions, specifier: "%.0f") \(AppTextVm.portions.localized(for: languageManager.currentLanguage))"  )
            }
            Divider()
               
            GridRow{
                Text(AppTextVm.proteins.localized(for: languageManager.currentLanguage))
                Text("\(macroDistributionVM.proteinPortions,specifier: "%.0f") \(AppTextVm.portions.localized(for: languageManager.currentLanguage))")
            }
            Divider()
            GridRow{
                Text(AppTextVm.fats.localized(for: languageManager.currentLanguage))
                Text("\(macroDistributionVM.fatsPortions,specifier: "%.0f") \(AppTextVm.portions.localized(for: languageManager.currentLanguage))")
            }
            Divider()
            Button(AppTextVm.cleanButton.localized(for: languageManager.currentLanguage)){
                dismiss();
                userDataVM.cleanResetForm()
                
            }
                .font(.headline .bold())
                .frame(maxWidth: .infinity)
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
            
        }
        
    }
}

#Preview {
    let userDataVM = UserDataViewModel()
    let macroDistributionVM = MacroDistributionVM(userDataVm: userDataVM)
    let laguageManger = LanguageManager()
    MacroCard()
        .environmentObject(userDataVM)
        .environmentObject(macroDistributionVM)
        .environmentObject(laguageManger)
}
