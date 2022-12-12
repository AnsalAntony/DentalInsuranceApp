//
//  ChieldDetailViewModelTest.swift
//  DentalCareTests
//
//  Created by Ansal Antony on 12/12/22.
//

import Foundation
@testable import DentalCare
import XCTest


class ChieldDetailViewModelTest: XCTestCase {
    
    var chieldModel: ChieldDetailViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        chieldModel = ChieldDetailViewModel()
    }
    
    func testChieldSucess(){
        let chieldSucess = chieldModel.validateChieldDetails(personalNumber: "20180621", name: "john", age: "4", gender: "M", house: "test house", street: "test Streeet", post: "test post", city: "test city")
        XCTAssertTrue(chieldSucess.status)
        
    }
    
    func testChieldFalse(){
        let chieldFaild = chieldModel.validateChieldDetails(personalNumber: "", name: "", age: "", gender: "", house: "", street: "", post: "", city: "")
        XCTAssertFalse(chieldFaild.status)
        
    }
    
    func testGenderSucess(){
        let genderCheckSucess = chieldModel.manageGender(gender: "M", selection: true)
        XCTAssertEqual(genderCheckSucess, "M")
    }
    
    func testGenderFalse(){
        let genderCheckFalse = chieldModel.manageGender(gender: "M", selection: false)
        XCTAssertNotEqual(genderCheckFalse, "M")
    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
