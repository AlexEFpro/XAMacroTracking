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
    @Published var activityLevel: ActivityLevel = .sedentary
    @Published var objective: Objective = .mantain
    @Published var goToSheet : Bool = false
    @Published var isGrCalculated : Bool = false
    @Published var gastoCalculado: Double = 0
    @Published var gastoForFrecuency : Double=0
    @Published var gastoForObjective : Double = 0
    @Published var grProtein: Double = 0
    @Published var grCarbohydrates: Double = 0
    @Published var grFats: Double = 0
    @Published var isLoged: Bool = true
    
    enum Gender: String, CaseIterable {
        case male
        case female
    }
    enum ActivityLevel: String, CaseIterable {
        
        case sedentary = "No exercise"
        
        case lightlyActive = "1-3 days x weel"
        case moderatelyActive = "3-5 days x week"
        case veryActive = "6-7 days x week"
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
        gastoForFrecuency = 0
        gastoForObjective = 0
        grProtein = 0
        grCarbohydrates = 0
        grFats = 0
    }
    
    func calcGEAF(){
        switch activityLevel {
        case .sedentary: gastoForFrecuency = gastoCalculado
        case .lightlyActive:
            gastoForFrecuency = gastoCalculado * 1.375
        case .moderatelyActive:
            gastoForFrecuency = gastoCalculado * 1.55
        case .veryActive:
            gastoForFrecuency = gastoCalculado * 1.725
        }
    }
    
    func calcGastoForObjective(){
        switch objective {
        case .cut:
            gastoForObjective = gastoForFrecuency - 500
        case .bulk:
            gastoForObjective = gastoForFrecuency + 500
        default:
            gastoForObjective = gastoForFrecuency
        }
       
    }
    
    func calcMAcros(){
        switch objective {
        case .cut:
            grFats = weight * 1
            grProtein = weight * 3
            grCarbohydrates = weight * 2
        case .bulk:
            grFats = weight * 1.2
            grProtein = weight * 2.5
            grCarbohydrates = weight * 3.5
            
        case .mantain:
            grFats = weight * 1
            grProtein = weight * 2
            grCarbohydrates = weight * 3
            
            
        }
        
    }
    
    func allTheCalcs(){
        gastoBasal()
        calcGEAF()
        calcGastoForObjective()
        calcMAcros()
    }

    
    
}
