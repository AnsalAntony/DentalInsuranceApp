//
//  LoginViewModel.swift
//  DentalCare
//
//  Created by Ansal Antony on 11/12/22.
//

import Foundation

final class LoginViewModel {
    
    func validateLogin(personalNumber: String, name: String) -> (status: Bool, message: String){
        if(personalNumber == ""){
            return(false, Constants.chieldPersonalErr)
            
        }else if(name == ""){
            
            return(false, Constants.chieldNameErr)
        }
        return (true , "")
    }
    
}
