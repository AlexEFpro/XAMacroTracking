//
//  AppTextVm.swift
//  XAMacroTracking
//
//  Created by Alejandro  Salinas Ramirez on 30/09/25.
//

import Foundation

enum AppTextVm {
    case MainInstruction
    //BasicForm
    case weight
    case height
    case  age
    case gender
    case activityLevel
    case objective
    case calculateButton
    //MacroCard
    case energyRequirement
    case carbs
    case proteins
    case fats
    case cleanButton
    case portions
    case weightUnit
    case heightUnit
    func localized(for language : Language)-> String{
        let translations : [AppTextVm : [Language : String]] = [
            // BasicForm
            .MainInstruction : [
                .spanish : "Ingresa los valores  acontinuación señalados ",
                .english : "Enter the values below"
            ],
            .weight : [
                .spanish : "Peso",
                .english : "Weight"
            ],
            .height: [
                .spanish : "Altura",
                .english : "Height"
            ],
            .age: [
                .spanish : "Edad",
                .english : "Age"
            ],
            .gender: [
                .spanish : "Género",
                .english : "Gender"
            ],
            .activityLevel: [
                .spanish : "Frecuencia",
                .english : "Frecuency"
                
            ],
            .objective : [
                .spanish : "Objetivo",
                .english : "Objective"
            ],
            .calculateButton : [
                .spanish : "Calcular",
                .english : "Calculate"
            ],
            //MacroCard
            .energyRequirement : [
                .english : "Energy Requirement",
                .spanish : "Requerimiento Energético"
            ],
            .carbs : [
                .english : "Carbohydrates",
                .spanish : "Carbohidratos"
            ],
            .proteins : [
                .english : "Proteins",
                .spanish : "Proteínas"
            ],
            .fats : [
                .english : "Fats",
                .spanish : "Grasas"
            ],
            .cleanButton : [
                .english : "Back",
                .spanish : "Regresar"
                ],
            .portions : [
                .english : "portions",
                .spanish : "porciones"],
            .weightUnit : [
                .english : "lbs",
                .spanish : "kg"
                    ],
            .heightUnit : [
                .english : "ft",
                .spanish : "cm"
                
            ]
            
            
        ]
        return translations[self]?[language] ?? ""
    }
}


