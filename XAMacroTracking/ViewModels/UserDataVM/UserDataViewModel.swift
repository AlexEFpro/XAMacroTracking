 //
//  UserDataViewModel.swift
//  XAMacroTracking
//
//  Created by Alejandro  Salinas Ramirez on 18/08/25.
//

import Foundation

class UserDataViewModel: ObservableObject {
    @Published var weight: Double = 0
    @Published var height: Double = 0
    @Published var age: Double = 0
    @Published var gender: Gender = .male
    @Published var activityLevel: ActivityLevel = .lightlyActive
    @Published var objective: Objective = .mantain
    @Published var goToSheet : Bool = false
    @Published var isGrCalculated : Bool = false
    @Published var gastoCalculado: Double = 0
    
    
    enum Gender: String, CaseIterable {
        case male
        case female
    }
    enum ActivityLevel: String, CaseIterable {
        
        case lightlyActive
        case moderatelyActive
        case veryActive
    }
    enum Objective: String, CaseIterable {
        case cut
        case bulk
        case mantain
    }
    
    func gastoBasal(){
        if gender == .male{ gastoCalculado = (10*weight)+(6.25*height)-(5*age+5)
            
            
        }
        else{
            gastoCalculado = (10*weight)+(6.25*height)-(5*age)-161
            
            
        }
       
    }
    func cleanResetForm(){
        weight = 0
        height = 0
        age = 0
        gender = .male
        activityLevel = .lightlyActive
        objective = .mantain
        gastoCalculado = 0
    }

    
    
}
