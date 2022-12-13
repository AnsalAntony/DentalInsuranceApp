//
//  BankDetailsViewModelTest.swift
//  DentalCareTests
//
//  Created by Ansal Antony on 13/12/22.
//

import Foundation
@testable import DentalCare
import XCTest

class BankDetailsViewModelTest: XCTestCase {
    
    var bankModel: BankDetailsViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        bankModel = BankDetailsViewModel()
    }
    
    func validateBanks(){
        
        let validateBanksucess = bankModel.validateBankDetails(bankId: "2342", accountNumber: "12312412", bankName: "some bank name")
        XCTAssertTrue(validateBanksucess.status)
    }
    
    func validateBankFaild(){
        
        let validateBanksucess = bankModel.validateBankDetails(bankId: "", accountNumber: "12312412", bankName: "")
        XCTAssertFalse(validateBanksucess.status)
    }
    
    
}
