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
//        VStack{
//            LazyVGrid(columns: [GridItem(.flexible())], content: {
//                Text("Porciones de proteina: \(macroDistributionVM.proteinPortions, specifier: "%.0f")")
//                Text("Porciones de carbos: \(macroDistributionVM.carbPortions, specifier: "%.0f")")
//                Text("Porciones de Grasas: \(macroDistributionVM.fatPortions, specifier: "%.0f")")
//            })
//        }
        Grid{
//            GridRow{
//                Text("GEAF")
//                Text("\(userDataVM.gastoForFrecuency, specifier: "%.1f")")
//            }
//            Divider()
//            GridRow{
//                Text("Gasto Calorico Basal")
//                Text("\(userDataVM.gastoCalculado, specifier: "%.1f")")
//            }
//            Divider()
            GridRow{
                
                Text("Necesidades caloricas por objetivo")
                    .font(.headline .bold())
                    .foregroundStyle(.blue)
                Text("\(userDataVM.gastoForObjective, specifier: "%.1f") Cal")
                    .bold()
            }
            Divider()
            
            GridRow{
                Text("Carbohidratos")
                    .font(.headline .bold())
                    .foregroundStyle(.blue)
                Text("\(macroDistributionVM.carbPortions, specifier: "%.0f") Portions")
                    .bold()
            }
            Divider()
               
            GridRow{
                Text("Proteinas")
                    .font(.headline .bold())
                    .foregroundStyle(.blue)
                Text("\(macroDistributionVM.proteinPortions, specifier: "%.0f") Portions")
                    .bold()
            }
            Divider()
            GridRow{
                Text("Grasa")
                    .font(.headline .bold())
                    .foregroundStyle(.blue)
                Text("\(macroDistributionVM.fatPortions, specifier: "%.0f") Portions")
                    .bold()
            }
            Divider()
            Button("Volver a Calcular"){
                dismiss();
                userDataVM.cleanResetForm()
                
            }
                .font(.title3 .bold())
                .frame(maxWidth: .infinity)
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
            
        }
//        .alert("Quieres un plan alimenticio acorde a tus requerimientos de actividad y objetivo?",isPresented: $userDataVM.isLoged){
//            Button("Si"){
//                dismiss()
//            }
//
//
//            Button("No"){
//
//            }
//        }
           
        
    }
}

#Preview {
    let userDataVM = UserDataViewModel()
    let macroDistributionVM = MacroDistributionVM(userData: UserDataViewModel())
    MacroCard()
        .environmentObject(userDataVM)
        .environmentObject(macroDistributionVM)
}
