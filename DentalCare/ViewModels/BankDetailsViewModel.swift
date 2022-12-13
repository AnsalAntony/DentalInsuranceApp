//
//  BankDetailsViewModel.swift
//  DentalCare
//
//  Created by Ansal Antony on 12/12/22.
//

import Foundation

final class BankDetailsViewModel {
    
    
    func validateBankDetails(bankId: String, accountNumber: String, bankName: String) -> (status: Bool, message: String) {
        
        if(bankId == ""){
            return(false, Constants.bankIdErr)
            
        }else if(accountNumber == ""){
            
            return(false, Constants.bankAccountErr)
        }else if (bankName == ""){
            
            return(false, Constants.bankNameError)
        }
        
        return (true, "")
        
    }
    
}
