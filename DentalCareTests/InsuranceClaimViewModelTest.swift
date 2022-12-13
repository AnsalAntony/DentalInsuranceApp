//
//  InsuranceClaimViewModelTest.swift
//  DentalCareTests
//
//  Created by Ansal Antony on 13/12/22.
//

import Foundation
@testable import DentalCare
import XCTest

class InsuranceClaimViewModelTest: XCTestCase {

    var insuranceViewModel: InsuranceClaimViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        insuranceViewModel = InsuranceClaimViewModel()
    }
   
    func testInsuranceClaimSucess(){
        let InsuranceClaim = insuranceViewModel.InsuranceClaimValidation(pollicyNumber: "1231312", date: "12/06/2022", reason: "some reason", paln: "silver", otherClaimStr: "NO", otherClaimBool: false)
        XCTAssertTrue(InsuranceClaim.status)
        
    }
    func testInsuranceClaimFaild(){
        let InsuranceClaim = insuranceViewModel.InsuranceClaimValidation(pollicyNumber: "1231312", date: "", reason: "", paln: "silver", otherClaimStr: "", otherClaimBool: false)
        XCTAssertFalse(InsuranceClaim.status)
        
    }
    
    func testInsurancePlamSucess(){
        let InsurancePlan = insuranceViewModel.managePlan(plan: "gold", selection: true)
        XCTAssertEqual(InsurancePlan, "gold")
        
    }
    
    func testInsuranceOtherClainSucess(){
        let InsuranceOtherClaim = insuranceViewModel.manageOtherClaim(claim: "YES", selection: true)
        XCTAssertEqual(InsuranceOtherClaim, "YES")
        
    }
    
}
