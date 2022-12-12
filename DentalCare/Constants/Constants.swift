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
    static let chieldNameErr = "Please enter your child name"
    static let chieldAgeErr = "Please enter your child age"
    static let chieldgenderErr = "Please enter your child gender"
    static let chieldHouseErr = "Please enter house name"
    static let chieldStreetErr = "Please enter street name"
    static let chieldPostErr = "Enter postal code"
    static let chieldCityErr = "Enter city code"
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
        static let childDetailViewController = "ChildDetailViewController"
        static let parentDetailsViewController = "ParentDetailsViewController"
        static let bankDetailsViewController = "BankDetailsViewController"
        
    }

}
