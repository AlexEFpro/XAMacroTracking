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
            if colorScheme == .dark{
                Image("DarkLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250,alignment: .center)
                
            }else{
                Image("LightLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350, height: 350,alignment: .center)
                    
            }
            
                
        }
        
        
    }
}

#Preview {
    Logo()
}
