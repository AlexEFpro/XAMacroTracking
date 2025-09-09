//
//  MacroTable.swift
//  XAMacroTracking
//
//  Created by Alejandro  Salinas Ramirez on 26/08/25.
//

import SwiftUI

struct MacroTable: View {
    var body: some View {
        Grid{
            GridRow{
                Text("Nutriente/Comida")
                    .font(.title2.bold())
            }
        }
    }
}

#Preview {
    MacroTable()
}
