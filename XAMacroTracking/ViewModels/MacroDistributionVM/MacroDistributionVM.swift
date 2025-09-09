//
//  MacroDistributionVM.swift
//  XAMacroTracking
//
//  Created by Alejandro  Salinas Ramirez on 26/08/25.
//

import Foundation
import SwiftUICore

class MacroDistributionVM: ObservableObject {
    @Published var proteinPortions : Double = 0.0
    @Published var carbPortions : Double = 0.0
    @Published var fatPortions : Double = 0.0
    private var userData : UserDataViewModel
   @EnvironmentObject var userDataVM: UserDataViewModel
    init(userData: UserDataViewModel){
        self.userData = userData
    }
        
    
    
    func calcPortions(){
        proteinPortions = userData.grProtein*4 / 40
        carbPortions = userData.grCarbohydrates*4 / 70
        fatPortions = userData.grFats*9/40
        
    }
    enum Nutrients: String , CaseIterable{
        case cerealesNoFat = "Cereales sin grasa"
        case cerealesWFat = "Cereales con grasa"
        case Frutas  = "Frutas"
        case Verduras = "Verduras"
        case LacteosNoFat = "Lacteos sin grasa"
        case LacteosWFat = "Lacteos con grasa"
        case Leguminosas = "Leguminosas"
        case GrasasNProt = "Grasas sin proteina"
        case GrasasWProt = "Grasas con proteina"
        case Azucares = "Azucares"
        case ProteinasA = "Proteinas A"
        case ProteinasB = "Proteinas B"
        case ProteinasC = "Proteinas C"
        
        
    }
    
    
}
