//
//  BasicForm.swift
//  XAMacroTracking
//
//  Created by Alejandro  Salinas Ramirez on 18/08/25.
//

import SwiftUI

struct BasicForm: View {
    @EnvironmentObject private var userDataVM: UserDataViewModel
   
    var body: some View {
        Form{
            
                
            Section{
                
                HStack {
                    Spacer()
                    Text("Ingresa los valores  acontinuación señalados ")
                        .font(.title2 .bold())
                        
                        
                    Spacer()
                }
                
                Slider(value: $userDataVM.weight, in: 30...200.0, step: 0.1)
                    .padding()
                Text("Peso:\(userDataVM.weight, specifier: "%.1f")kg" )
                    .font(.headline .bold())
                
                Slider( value: $userDataVM.height, in: 130...230, step: 0.1)
                Text("Altura:\(userDataVM.height, specifier: "%.0≈f")cm")
                    .font(.headline .bold())
                
                    .padding()
                HStack {
                    Picker("Edad", selection: $userDataVM.age) {
                        ForEach(15...100, id: \.self) {
                            Text("\($0)").tag(Double($0))
                        }
                    }
                    .padding()
                    Picker("Gender", selection: $userDataVM.gender) {
                        ForEach(UserDataViewModel.Gender.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                }
                
                Picker("Nivel de activiad fisica",selection: $userDataVM.activityLevel ){
                    ForEach(UserDataViewModel.ActivityLevel.allCases, id: \.self){
                        Text($0.rawValue)
                    }
                }
                .padding()
                Picker("Objetivo",selection: $userDataVM.objective ){
                    ForEach(UserDataViewModel.Objective.allCases, id: \.self){
                        Text($0.rawValue)
                    }
                }
                
                
            
                Button("Calcular"){
                    userDataVM.goToSheet = true;
                    userDataVM.gastoBasal()
                }
                    .font(.title3.bold())
                    .frame(maxWidth:.infinity)
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                
            }
           
        }
        .sheet(isPresented: $userDataVM.goToSheet){
            MacroCard()
                
        }
    }
}

#Preview {
    let userDataVM = UserDataViewModel()
    
    BasicForm()
        .environmentObject(userDataVM)
}
