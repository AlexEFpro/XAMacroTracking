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
                Text("\(userDataVM.gastoBasalCalculado, specifier: "%.1f")")
            }
            Divider()
            
            GridRow{
                Text("Carbo hidratos")
                Text("\(macroDistributionVM.grCarbs, specifier: "%.0f")gr")
            }
            Divider()
               
            GridRow{
                Text("Proteinas")
                Text("\(macroDistributionVM.grProtein,specifier: "%.0f") gr")
            }
            Divider()
            GridRow{
                Text("Grasa")
                Text("\(macroDistributionVM.grFats,specifier: "%.0f") gr")
            }
            Divider()
            Button("Suscribe"){
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
