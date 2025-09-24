//
//  XAMacroTrackingTests.swift
//  XAMacroTrackingTests
//
//  Created by Alejandro  Salinas Ramirez on 23/09/25.
//

import Testing
@testable import XAMacroTracking // this import allows to test internal entities, methods and all in the project

struct XAMacroTrackingTests {
    
    @Test("Test Gasto Basal") func gastoBasal(){
        // Male
        let vmMale = UserDataViewModel()
        vmMale.weight = 70
        vmMale.height = 175
        vmMale.age = 25
        vmMale.gender = .male
        vmMale.gastoBasal()
        #expect(vmMale.gastoBasalCalculado == (10*vmMale.weight)+(6.25*vmMale.height)-(5*vmMale.age+5))
        //Female
        let vmFemale = UserDataViewModel()
        vmFemale.weight = 60
        vmFemale.height = 165
        vmFemale.age = 30
        vmFemale.gender = .female
        vmFemale.gastoBasal()
        #expect(vmFemale.gastoBasalCalculado  == (10*vmFemale.weight)+(6.25*vmFemale.height)-(5*vmFemale.age)-161)
        
        
        
    }
    
    @Test("GEAF Test") func geafTest(){
        //sedentary
        let vmSedentary = UserDataViewModel()
        vmSedentary.gastoBasalCalculado = 2500
        vmSedentary.activityLevel = .sedentary
        vmSedentary.geafCalc()
        #expect(vmSedentary.geaf == vmSedentary.gastoBasalCalculado)
        //lightlyActive
        let vmLightlyActive = UserDataViewModel()
        vmLightlyActive.gastoBasalCalculado = 2500
        vmLightlyActive.activityLevel = .lightlyActive
        vmLightlyActive.geafCalc()
        #expect(vmLightlyActive.geaf == vmLightlyActive.gastoBasalCalculado*1.375)
    // moderatelyActive
        let vmModeratelyActive = UserDataViewModel()
        vmModeratelyActive.gastoBasalCalculado = 2500
        vmModeratelyActive.activityLevel = .moderatelyActive
        vmModeratelyActive.geafCalc()
        #expect(vmModeratelyActive.geaf == vmModeratelyActive.gastoBasalCalculado*1.55)
        //veryActive
        let vmVeryActive = UserDataViewModel()
        vmVeryActive.gastoBasalCalculado = 2500
        vmVeryActive.activityLevel = .veryActive
        vmVeryActive.geafCalc()
        #expect(vmVeryActive.geaf == vmVeryActive.gastoBasalCalculado*1.725)
    }



}
