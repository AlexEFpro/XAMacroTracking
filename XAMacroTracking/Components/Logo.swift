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
                    .frame(width: 80, height: 80,alignment: .trailing)
                    .padding(.leading)
                
            }else{
                Image("LightLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80,alignment: .trailing)
                    .padding(.leading)
            }
            Text("MACRO TRACKING")
                .font(.title .bold())
                .foregroundStyle(.blue)
                
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

#Preview {
    Logo()
}
