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
   
    var body: some View {
        Grid{
            GridRow{
                Text("Energy requirements")
                Text("\(userDataVM.gObjective, specifier: "%.0f")")
            }
            Divider()
            
            GridRow{
                Text("Carbo hidratos")
                Text("\(macroDistributionVM.carbsPortions, specifier: "%.0f") portions")
            }
            Divider()
               
            GridRow{
                Text("Proteinas")
                Text("\(macroDistributionVM.proteinPortions,specifier: "%.0f") portions")
            }
            Divider()
            GridRow{
                Text("Grasa")
                Text("\(macroDistributionVM.fatsPortions,specifier: "%.0f") portions")
            }
            Divider()
            Button("Clean"){
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
    MacroCard()
        .environmentObject(userDataVM)
        .environmentObject(macroDistributionVM)
}
