//
//  Logo.swift
//  XAMacroTracking
//
//  Created by Alejandro  Salinas Ramirez on 17/08/25.
//

import SwiftUI

struct Logo: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        HStack{
            
            Image(colorScheme == .dark ? "DarkLogo" : "LightLogo")
                .resizable()
                .scaledToFit()
                .frame(maxWidth:350)
                .padding(.top,16)
            
                
            
                
                

                
        }
        
        
    }
}

#Preview {
    Logo()
}
