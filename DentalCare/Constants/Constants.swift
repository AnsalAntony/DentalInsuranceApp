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
    static let parentEmailErr = "Please enter your email address"
    static let parentPersonalErr = "Please enter your personal number"
    static let parentNameErr = "Please enter your name"
    static let parentphomeErr = "Please enter your mobile number"
    static let parentRelationErr = "Please mention the relationship with the child"
    
    static let bankIdErr = "Enter your bank Id"
    static let bankAccountErr = "Enter your bank acount number"
    static let bankNameError = "Enter your bank bank name"
    
    static let claimPolicyErr = "Enter the policy number"
    static let claimDateErr = "Please enter child injured date"
    static let claimReasonError = "Please describe how the child got injured"
    static let claimPlanError = "Select your insurance plan"
    static let otherclaimError = "Please describe if you made any other claime in the same period"
    
    static let bankDetails = "Bank Details"
    static let dentalCare = "Dental Care"
    static let emaiValidation = "Please enter a valied email address"
    static let cardViewTopConstraint: CGFloat = 100
    static let cardViewBottomConstraint: CGFloat = 50
    static let formateTodoDate = "dd/MM/yyyy"
    static let injurieReason = "Please mention the reason for injurie *"
    
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
