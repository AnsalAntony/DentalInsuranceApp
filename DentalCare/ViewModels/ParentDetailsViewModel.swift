//
//  ParentDetailsViewModel.swift
//  DentalCare
//
//  Created by Ansal Antony on 12/12/22.
//

import Foundation


final class ParentDetailsViewModel {
    
    
    func  parentDetails(personalNumber: String, name: String, email: String, mobile: String,  releation: String, house: String, street: String, post: String, city: String) -> (status: Bool, message: String){
        
        if(personalNumber == ""){
            return(false, Constants.parentPersonalErr)
            
        }else if(name == ""){
            
            return(false, Constants.parentNameErr)
        }else if(email == ""){
            
            return(false, Constants.parentEmailErr)
        }else if (!Formaters.shared.isValidEmail(email: email)){
            
            return(false, Constants.emaiValidation)
        }
        else if(mobile == ""){
            
            return(false, Constants.parentphomeErr)
        }else if(releation == ""){
            
            return(false, Constants.parentRelationErr)
        }else if(house == ""){
            
            return(false, Constants.chieldHouseErr)
        }else if(street == ""){
            
            return(false, Constants.chieldStreetErr)
        }else if(post == ""){
            
            return(false, Constants.chieldPostErr)
        }else if(city == ""){
            
            return(false, Constants.chieldPostErr)
        }

        return (true , "")
    }
    
    func manageReletationShip(reletationShip: String, selection: Bool) -> String {
        if(selection){
            return reletationShip
        }
        
        return ""
    }
}
