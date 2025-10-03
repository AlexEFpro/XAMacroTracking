//
//  LanguageManager.swift
//  XAMacroTracking
//
//  Created by Alejandro  Salinas Ramirez on 30/09/25.
//

import Foundation

enum Language: String , CaseIterable{
   
    
    case english = "English"
    case spanish = "Spanish"
    
    var userImperial: Bool{
        self == .english
    }
    
}

class LanguageManager : ObservableObject{
    @Published var currentLanguage : Language = .spanish
    
    
    
    func toggleLanguage(){
        currentLanguage = (currentLanguage == .spanish) ? .english : .spanish
        
        
    }
    
}
