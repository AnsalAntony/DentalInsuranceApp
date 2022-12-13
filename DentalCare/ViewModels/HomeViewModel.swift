//
//  HomeViewModel.swift
//  DentalCare
//
//  Created by Ansal Antony on 13/12/22.
//

import Foundation

final class HomeViewModel {
        
    var claimModel = [InsuranceClaimModel]()
    
    typealias CompletionHandler = () -> Void
    
    func takeItems(completion: CompletionHandler){
        let savedTask = DatabaseHelper.shared.getAllItems()
        claimModel.removeAll()
        claimModel.append(contentsOf: savedTask)
       completion()
    }
    
}
