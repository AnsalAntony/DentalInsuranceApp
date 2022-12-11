//
//  Constants.swift
//  DentalCare
//
//  Created by Ansal Antony on 11/12/22.
//

import Foundation
import UIKit


struct Constants {
    
    static let chieldPersonalErr = "Please enter child personal number"
    static let claimRegisteredSuccessfully = "claim registered successfully. it will take 5 working days to approve "
    static let chieldNameErr = "Please enter child name"
    static let childDetails = "Child Details"
    static let parentDetails = "Parent Details"
    static let bankDetails = "Bank Details"
    static let dentalCare = "Dental Care"
    static let cardViewTopConstraint: CGFloat = 100
    static let cardViewBottomConstraint: CGFloat = 50
    
    struct nibId {
       static let insuranceTableViewCell =  "InsuranceTableViewCell"
    }
    struct storyboardId {

        static let homeViewController = "HomeViewController"
        static let insuranceClaimViewController = "InsuranceClaimViewController"
        
    }

}
