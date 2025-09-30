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
    @Published var gastoBasalCalculado: Double = 0
    @Published var geaf: Double = 0
    @Published var gObjective : Double = 0
    
    
    enum Gender: String, CaseIterable {
        case male
        case female
    }
    enum ActivityLevel: String, CaseIterable {
        case sedentary = "No excercise"
        case lightlyActive = "1-3 /week"
        case moderatelyActive = "3-5 days/week"
        case veryActive = "6 >sessions/week"
    }
    enum Objective: String, CaseIterable {
        case cut
        case bulk
        case mantain
    }
    
    func gastoBasal(){
        if gender == .male{ gastoBasalCalculado = (10*weight)+(6.25*height)-(5*age+5)
            
            
        }
        else{
            gastoBasalCalculado = (10*weight)+(6.25*height)-(5*age)-161
            
            
        }
       
    }
    
    func geafCalc(){
        switch activityLevel {
        case .sedentary : geaf = gastoBasalCalculado
        case .lightlyActive : geaf = gastoBasalCalculado * 1.375
        case .moderatelyActive : geaf = gastoBasalCalculado * 1.55
        case .veryActive : geaf = gastoBasalCalculado * 1.725
        }
    }
    
    func gObjectiveCalc(){
        switch objective {
        case .cut : gObjective = geaf - 500
        case .bulk : gObjective = geaf + 500
        case .mantain : gObjective = geaf
        
        }
    }
    
    func userDataAllCalculations(){
        gastoBasal();
        geafCalc();
        gObjectiveCalc();
    }
    
    func cleanResetForm(){
        weight = 0
        height = 0
        age = 0
        gender = .male
        activityLevel = .lightlyActive
        objective = .mantain
        gastoBasalCalculado = 0
    }

    
    
}
