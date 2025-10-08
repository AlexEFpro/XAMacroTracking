//
//  BasicForm.swift
//  XAMacroTracking
//
//  Created by Alejandro  Salinas Ramirez on 18/08/25.
//

import SwiftUI

struct BasicFormView: View {
    @EnvironmentObject private var userDataVM: UserDataViewModel
    @EnvironmentObject private var macroDistributionVM: MacroDistributionVM
    @EnvironmentObject private var languageManager : LanguageManager
    
    var body: some View {
        Form{
            
            
            Section{
                
                HStack {
                    
                    Spacer()
                    Text(AppTextVm.MainInstruction.localized(for: languageManager.currentLanguage))
                        .font(.title2 .bold())
                    
                    
                    
                    Spacer()
                    disclaimerButton()
                }
                
                weightSlider()
                
                heightSlider()
                
                agePicker()
                
                activityLevelPicker()
                
                objectivePicker()
                
               calculateButton()
                
            }
            
        }
        .sheet(isPresented: $userDataVM.goToSheet){
            MacroCard()
                .environmentObject(userDataVM)
                .environmentObject(macroDistributionVM)
            
        }
        .sheet(isPresented: $userDataVM.goToDisclaimer){
            disclaimerCitations()
                .environmentObject(languageManager)
        }
    }
}

#Preview {
    let userDataVM = UserDataViewModel()
    let macroDistributionVM = MacroDistributionVM(userDataVm: userDataVM)
    let languageManager = LanguageManager()
    
    BasicFormView()
        .environmentObject(userDataVM)
        .environmentObject(macroDistributionVM)
        .environmentObject(languageManager)
}

