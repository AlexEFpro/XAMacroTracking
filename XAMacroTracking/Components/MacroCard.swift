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
   
    var body: some View {
        Grid{
            GridRow{
                Text("Gasto Calorico Basal")
                Text("\(userDataVM.gastoBasalCalculado, specifier: "%.1f")")
            }
            Divider()
            
            GridRow{
                Text("Carbo hidratos")
                Text("0gr")
            }
            Divider()
               
            GridRow{
                Text("Proteinas")
                Text("0gr")
            }
            Divider()
            GridRow{
                Text("Grasa")
                Text("0gr")
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
    MacroCard()
        .environmentObject(userDataVM)
}
