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
    
    @Test("Objective calc Test") func objectiveCalcTest(){
        //cut
        let vmCut = UserDataViewModel()
        vmCut.geaf = 2500
        vmCut.objective = .cut
        vmCut.gObjectiveCalc()
        #expect(vmCut.gObjective == 2000)
        
        //bulk
        let vmBulk = UserDataViewModel()
        vmBulk.geaf = 2500
        vmBulk.objective = .bulk
        vmBulk.gObjectiveCalc()
        #expect(vmBulk.gObjective == 3000)
        
        //maintain
        let vmMaintain = UserDataViewModel()
        vmMaintain.geaf = 2500
        vmMaintain.objective = .mantain
        vmMaintain.gObjectiveCalc()
        #expect(vmMaintain.gObjective == vmMaintain.geaf)
        
        
    }
    
    @Test("Gr per Macros") func grPerMacrosTest(){
        // Cut
        
        let userDataCut = UserDataViewModel()
        let macroVm = MacroDistributionVM(userDataVm: userDataCut)
        userDataCut.weight = 70
        userDataCut.objective = .cut
        
        macroVm.calcMacroGrams()
        #expect(macroVm.grProtein == 2.7*userDataCut.weight)
        #expect(macroVm.grCarbs == 2.0*userDataCut.weight)
        #expect( macroVm.grFats == 1.0*userDataCut.weight)
        //mantain
        let userDataMantain = UserDataViewModel()
        let macroVmMantain = MacroDistributionVM(userDataVm: userDataMantain)
        userDataMantain.weight = 70
        userDataMantain.objective = .mantain
        macroVmMantain.calcMacroGrams()
        #expect(macroVmMantain.grProtein == 2.2*userDataMantain.weight)
        #expect(macroVmMantain.grCarbs == 2.5*userDataMantain.weight)
        #expect( macroVmMantain.grFats == 1.0*userDataMantain.weight)
        
        //bulk
         let userDataBulk = UserDataViewModel()
        let macroVmBulk = MacroDistributionVM(userDataVm: userDataBulk)
        userDataBulk.weight = 70
        userDataBulk.objective = .bulk
        macroVmBulk.calcMacroGrams()
        #expect(macroVmBulk.grProtein == 2.5*userDataBulk.weight)
        #expect(macroVmBulk.grCarbs == 3.5*userDataBulk.weight)
        #expect( macroVmBulk.grFats == 1.2*userDataBulk.weight)
                
        
        
        
    }
}
