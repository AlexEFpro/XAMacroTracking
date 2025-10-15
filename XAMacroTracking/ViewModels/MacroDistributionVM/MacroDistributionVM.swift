//
//  MacroDistributionVM.swift
//  XAMacroTracking
//
//  Created by Alejandro  Salinas Ramirez on 26/08/25.
//

import Foundation
class MacroDistributionVM: ObservableObject {
    private var userDataVm : UserDataViewModel
    init(userDataVm: UserDataViewModel){
        self.userDataVm = userDataVm
    }
    
    private(set) var grProtein: Double = 0
    private(set) var grCarbs: Double = 0
    private(set) var grFats: Double = 0
    
    @Published var proteinPortions :Double = 0
    @Published var carbsPortions :Double = 0
    @Published var fatsPortions :Double = 0
    
    func calcMacroGrams(){
       var objective = userDataVm.objective
        var userWeight = userDataVm.weight
        grProtein = switch objective{
        case .cut : 2.7 * userWeight
        case .bulk : 2.5 * userWeight
        case .mantain : 2.2 * userWeight
            
        }
        grCarbs = switch objective{
        case .cut : 2.0 * userWeight
        case .bulk : 3.5 * userWeight
        case .mantain : 2.5 * userWeight
            
        }
        grFats = switch objective{
            case .cut : 1.0 * userWeight
            case .bulk : 1.2 * userWeight
            case .mantain : 1.0 * userWeight
        }
        
        
        
    }
    
    func calcMacroPortions(){
       
        proteinPortions = (grProtein * 4) / 45
        carbsPortions = (grCarbs * 4) / 70
        fatsPortions = (grFats * 9) / 45
        
    }
    func allCalculations(language: Language){
        userDataVm.userDataAllCalculations(language: language)
        calcMacroGrams()
        calcMacroPortions()
    }
    
    enum nutrientType: String,CaseIterable{
        case CerealsA = "CerealsA",
             CerealsB = "CerealsB",
             Legumes = "Legumes",
             Fruits = "Fruits",
             Vegetables = "Vegetables",
             DairyA = "DaiiryA",
             DayriB = "DairyB",
             ProteinsAB = "ProteinsAB",
             ProteinsC = "ProteinsC",
             FatsA = "FatsA",
             FatsB = "FatsB",
             Sugar = "Sugar"
        
        
    }
    
    
    
}
