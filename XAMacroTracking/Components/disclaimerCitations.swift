//
//  disclaimerCitations.swift
//  XAMacroTracking
//
//  Created by Alejandro  Salinas Ramirez on 07/10/25.
//

import SwiftUI

struct disclaimerCitations: View {
    @EnvironmentObject var languageManager: LanguageManager
    var body: some View {
        VStack{
            Grid{
                GridRow{
                    Text(AppTextVm.disclaimer.localized(for: languageManager.currentLanguage))
                        .font(.headline .bold())
                        
                        
                        
                }
                
                .padding()
                
                GridRow{
                    Text(AppTextVm.citations.localized(for: languageManager.currentLanguage))
                        .font(.footnote .bold())
                    }
                .padding()
            }
        }
        .padding()
    }
}

#Preview {
    let language = LanguageManager()
    disclaimerCitations()
        .environmentObject(language)
}
