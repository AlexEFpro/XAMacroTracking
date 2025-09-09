//
//  Login.swift
//  XAMacroTracking
//
//  Created by Alejandro  Salinas Ramirez on 21/08/25.
//

import SwiftUI

struct Login: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        
        NavigationStack{
            Spacer()
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
                    .frame(width: 200, height: 200,alignment: .trailing)
                    .padding(.leading)
                
                Spacer()
                Button("Login") {
                    
                }
                .font(.title3.bold())
                .frame(maxWidth:.infinity)
                .buttonStyle(.borderedProminent)
                .controlSize(.extraLarge)
                .padding()
                Text("¿No tienes una cuenta?... Registrate")
                    .font(.headline .bold())
                    .padding(.bottom)
                Button("Sig In"){
                    
                }
                .font(.title3.bold())
                .frame(maxWidth:.infinity)
                .buttonStyle(.borderedProminent)
                .controlSize(.extraLarge)
                Spacer()
                
            }
        }
    }
}

#Preview {
    Login()
}
