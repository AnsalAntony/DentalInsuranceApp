//
//  ChieldDetailViewModel.swift
//  DentalCare
//
//  Created by Ansal Antony on 12/12/22.
//

import Foundation

final class ChieldDetailViewModel {
    
    func validateChieldDetails(personalNumber: String, name: String, age: String, gender: String, house: String, street: String, post: String, city: String) -> (status: Bool, message: String){
        if(personalNumber == ""){
            return(false, Constants.chieldPersonalErr)
            
        }else if(name == ""){
            
            return(false, Constants.chieldNameErr)
        }else if(age == ""){
            
            return(false, Constants.chieldAgeErr)
        }else if(gender == ""){
            
            return(false, Constants.chieldgenderErr)
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
    
    func manageGender(gender: String, selection: Bool) -> String {
        if(selection){
            
            return gender
        }
        
        return ""
    }
    
    
    
}
