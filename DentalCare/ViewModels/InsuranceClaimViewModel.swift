//
//  InsuranceClaimViewModel.swift
//  DentalCare
//
//  Created by Ansal Antony on 12/12/22.
//

import Foundation

final class InsuranceClaimViewModel{
    
    func  InsuranceClaimValidation(pollicyNumber: String, date: String, reason: String, paln: String, otherClaimStr: String, otherClaimBool: Bool) -> (status: Bool, message: String){
        
        if(pollicyNumber == ""){
            return(false, Constants.claimPolicyErr)
            
        }else if(date == ""){
            
            return(false, Constants.claimDateErr)
        }else if(reason == ""){
            
            return(false, Constants.claimReasonError)
        }else if(paln == ""){
            
            return(false, Constants.claimPlanError)
        }else if(otherClaimStr == ""){
            
            return(false, Constants.otherclaimError)
        }
        
        return (true , "")
    }
    
    func managePlan(plan: String, selection: Bool) -> String {
        if(selection){
            return plan
        }
        
        return ""
    }
    
    func manageOtherClaim(claim: String, selection: Bool) -> String {
        if(selection){
            return claim
        }
        
        return ""
    }
    
    typealias CompletionHandler = (_ success:Bool, _ message: String) -> Void
    func saveInsuranceClaim(pollicyNumber: String, date: String, reason: String, plan: String, otherClaimBool: Bool, completion: CompletionHandler){
        
        let claimModel = InsuranceClaimModel(policyNumber: pollicyNumber, dateInjury: date, reasonInjury: reason, insurancePlan: plan, otherClaim: otherClaimBool)
        
        DatabaseHelper.shared.saveItems(claimModel: claimModel)
        completion(true,Constants.claimRegisteredSuccessfully)
        
    }
    
    
}
