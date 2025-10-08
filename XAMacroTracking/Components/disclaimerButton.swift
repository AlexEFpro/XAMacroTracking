//
//  disclaimerButton.swift
//  XAMacroTracking
//
//  Created by Alejandro  Salinas Ramirez on 08/10/25.
//

import SwiftUI

struct disclaimerButton: View {
    @EnvironmentObject var userDataVM : UserDataViewModel
    @EnvironmentObject var languageManager : LanguageManager
    var body: some View {
        Button(action: { userDataVM.goToDisclaimer = true
            
            
        } , label: {
            Image(systemName: "info.circle")
                .font(.title2 .bold())
                
           
       })
    }
        
}

#Preview {
    let languageManager = LanguageManager()
    disclaimerButton()
        .environmentObject(languageManager)
}
