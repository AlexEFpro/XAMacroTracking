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
    case disclaimer
    case citations
    
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
                
            ],
            .disclaimer: [
                .english: " This app is intended for informational and educational purposes only. It does not provide medical advice, diagnosis, or treatment. Always seek the advice of your physician or other qualified health provider with any questions you may have regarding a medical condition, nutrition, or fitness program. ",
                
                    .spanish: "Esta aplicación tiene fines informativos y educativos únicamente. No proporciona consejos médicos, diagnóstico ni tratamiento. Siempre busca la asesoría de tu médico o otro profesional de la salud calificado con cualquier pregunta que puedas tener sobre una condición médica, nutrición o programa de entrenamiento."
                
                
            ],
            .citations: [
                .english:"Sources: Basal expenditure: Mifflin MD, St Jeor ST, Hill LA, Scott BJ, Daugherty SA, Koh YO. A new predictive equation for resting energy expenditure in healthy individuals. Am J Clin Nutr. 1990;51(2):241-247. \n Activity factors: Shils ME, Shike M. Modern nutrition in health and disease. 10th ed. Lippincott Williams & Wilkins; 2006. \n Energy balance: Hall Kevin D. (2017) ObesityEnergetics BodyWeight Regulation and the effects of Diet Composition",
                .spanish : " Fuentes: \n Gasto Basal:  Mifflin MD, St Jeor ST, Hill LA, Scott BJ, Daugherty SA, Koh YO. A new predictive equation for resting energy expenditure in healthy individuals. Am J Clin Nutr. 1990;51(2):241-247. \n Factores de actividad: Shils ME, Shike M. Modern Nutrition in Health and Disease. 10th ed. Lippincott Williams & Wilkins; 2006. \n Balance energetico: Hall Kevin D. (2017) ObesityEnergetics BodyWeight Regulation and the effects of Diet Composition."
                
                
                ]
            
            
        ]
        return translations[self]?[language] ?? ""
    }
}


