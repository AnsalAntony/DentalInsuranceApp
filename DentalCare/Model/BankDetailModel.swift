//
//  BankDetailModel.swift
//  DentalCare
//
//  Created by Ansal Antony on 13/12/22.
//

import Foundation
import RealmSwift

class BankDetailModel: Object {
    
    @Persisted @objc var bankId: String?
    @Persisted @objc var accountNumber: String?
    @Persisted @objc var bankName: String?
    
    
    convenience init(bankId: String, accountNumber: String, bankName: String){
        self.init()
        self.bankId = bankId
        self.accountNumber = accountNumber
        self.bankName = bankName
    }
    
}
