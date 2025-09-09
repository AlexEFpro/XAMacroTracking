//
//  LogIn:SigInForm.swift
//  XAMacroTracking
//
//  Created by Alejandro  Salinas Ramirez on 24/08/25.
//

import SwiftUI
import AuthenticationServices
import LocalAuthentication // biometric

struct LogIn_SigInForm: View {
    
    @State private var isAuthenticated : Bool = false
    @State private var showError : Bool = false
    @State private var errorMessage: String?
    var body: some View {
        VStack{
            if isAuthenticated{
                Text("Bienvenido")
                
                Button("Cerrar Sesión "){
                    isAuthenticated = false
                }
            } else{ // if the user aren't loged  this is the way using the framework
                SignInWithAppleButton(.signIn){
                    request in
                    request.requestedScopes = [.fullName,.email]
                } onCompletion: { result in
                    
                    handleAppleSignIn(result)
                }
                .signInWithAppleButtonStyle(.black)
                .frame(height: 50)
                .padding()
            }
        }
    }
    func handleAppleSignIn(_ result: Result<ASAuthorization,Error>){
        switch result{
        case .success(let authorization):
            if let _ = authorization.credential as? ASAuthorizationAppleIDCredential{
                // change the state  declared to interact with the app
                isAuthenticated = true
            }
        case .failure(let error):
            // error handling
            errorMessage = error.localizedDescription
            showError = true
            print("Error en la autenticacion: \(error.localizedDescription)")
            
        }
        
        
    }
}

#Preview {
    LogIn_SigInForm()
}
