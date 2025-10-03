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
                }
                
              weightSlider()
                
              heightSlider()
                    
                
                    
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
                
                Picker(AppTextVm.activityLevel.localized(for: languageManager.currentLanguage),selection: $userDataVM.activityLevel ){
                    ForEach(UserDataViewModel.ActivityLevel.allCases, id: \.self){level in Text(level.localized(for: languageManager.currentLanguage)).tag(level)
                        
                    }
                }
                .padding()
                Picker(AppTextVm.objective.localized(for: languageManager.currentLanguage),selection: $userDataVM.objective ){
                    ForEach(UserDataViewModel.Objective.allCases, id: \.self){ objective in Text(objective.localixed(for: languageManager.currentLanguage)).tag(objective)
                        
                    }
                }
                
                
            
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
        .sheet(isPresented: $userDataVM.goToSheet){
            MacroCard()
                .environmentObject(userDataVM)
                .environmentObject(macroDistributionVM)
                
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

