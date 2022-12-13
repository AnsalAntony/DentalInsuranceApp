//
//  ParentDetailsViewModelTest.swift
//  DentalCareTests
//
//  Created by Ansal Antony on 12/12/22.
//

import Foundation
@testable import DentalCare
import XCTest

class ParentDetailsViewModelTest: XCTestCase {

    var parentViewModel: ParentDetailsViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        parentViewModel = ParentDetailsViewModel()
    }
    
    func testParentSucess(){
        let parentSucess = parentViewModel.parentDetails(personalNumber: "199021061234", name: "some name", email: "ab@gmail.com", mobile: "02273737", releation: "Father", house: "some House", street: "some streeet", post: "2134124", city: "some city")
        XCTAssertTrue(parentSucess.status)
        
    }
    
    func testParentFaild(){
        let parentFaild = parentViewModel.parentDetails(personalNumber: "199021062133", name: "", email: "ab@gmail.com", mobile: "", releation: "Father", house: "", street: "", post: "2134124", city: "")
        XCTAssertFalse(parentFaild.status)
        
    }
    
    func testValidateEmail(){
        let parentEmailCheck = parentViewModel.parentDetails(personalNumber: "199021061234", name: "some name", email: "ab@", mobile: "02273737", releation: "Father", house: "some House", street: "some streeet", post: "2134124", city: "some city")
        XCTAssertFalse(parentEmailCheck.status)
        
    }
    
    func testReletionSucess(){
        
        let reletionSucess = parentViewModel.manageReletationShip(reletationShip: "Father", selection: true)
        XCTAssertEqual(reletionSucess, "Father")
    }
    
    func testReletionFaild(){
        
        let reletionSucess = parentViewModel.manageReletationShip(reletationShip: "Father", selection: false)
       XCTAssertNotEqual(reletionSucess, "Father")
    }

}
