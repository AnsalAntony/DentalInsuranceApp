//
//  LoginViewModelTest.swift
//  DentalCareTests
//
//  Created by Ansal Antony on 11/12/22.
//

import Foundation
@testable import DentalCare
import XCTest

class LoginViewModelTest: XCTestCase {
    
    var loginModel: LoginViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        loginModel = LoginViewModel()
    }
    
    func testLoginSucess(){
        
        let loginSucess = loginModel.validateLogin(personalNumber: "12312312", name: "some name")
        XCTAssertTrue(loginSucess.status)
        
    }
    
    func testPersonalNumber(){
        let personalNumberCheck = loginModel.validateLogin(personalNumber: "", name: "some name")
        XCTAssertFalse(personalNumberCheck.status)
        
    }
    func testName(){
        let nameCheck = loginModel.validateLogin(personalNumber: "123123", name: "")
        XCTAssertFalse(nameCheck.status)
        
    }
    
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
