//
//  DatabaseHelper.swift
//  DentalCare
//
//  Created by Ansal Antony on 13/12/22.
//

import Foundation
import RealmSwift
import UIKit


class DatabaseHelper {
    
    static let shared = DatabaseHelper()
    /// Open the local-only default realm
    private var realm = try! Realm()
    
    func getDatabasePath() -> URL?{
        return Realm.Configuration.defaultConfiguration.fileURL
    }
    
    func saveItems(claimModel: InsuranceClaimModel){
        try! realm.write({
            realm.add(claimModel)
        })
    }
    
    func getAllItems() -> [InsuranceClaimModel]{
        return Array(realm.objects(InsuranceClaimModel.self))
    }
    
}

