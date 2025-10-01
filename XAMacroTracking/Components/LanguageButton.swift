//
//  LanguageButton.swift
//  XAMacroTracking
//
//  Created by Alejandro  Salinas Ramirez on 30/09/25.
//

import SwiftUI

struct LanguageButton: View {
    @EnvironmentObject var languageManager: LanguageManager
    var body: some View {
        
        Toggle(isOn: Binding(
            get: { languageManager.currentLanguage == .spanish },
            set:{ isSpanish in
                languageManager.currentLanguage = isSpanish ? .spanish : .english
            }
        )) {
            Text("English / Español")
                .font(.headline)
                .bold()
        }
        .padding(.horizontal)   
        
    }
}

#Preview {
    let languageManager = LanguageManager()
    LanguageButton()
        .environmentObject(languageManager)
}
