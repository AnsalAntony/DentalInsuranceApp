//
//  ParentDetailModel.swift
//  DentalCare
//
//  Created by Ansal Antony on 13/12/22.
//

import Foundation
import RealmSwift

class ParentDetailModel: Object {
    
    @Persisted @objc var parentPersonalNumber: String?
    @Persisted @objc var parentName: String?
    @Persisted @objc var parentEmail: String?
    @Persisted @objc var parentMobil: String?
    @Persisted @objc var parentReleation: String?
    @Persisted @objc var parentHouse: String?
    @Persisted @objc var parentStreet: String?
    @Persisted @objc var parentPostal: String?
    @Persisted @objc var parentCity: String?
    
    convenience init(parentPersonalNumber: String, parentName: String, parentEmail: String, parentMobil: String, parentReleation: String, parentHouse: String, parentStreet:String, parentPostal: String, parentCity: String){
        self.init()
        self.parentPersonalNumber = parentPersonalNumber
        self.parentName = parentName
        self.parentEmail = parentEmail
        self.parentMobil = parentMobil
        self.parentReleation = parentReleation
        self.parentHouse = parentHouse
        self.parentStreet = parentStreet
        self.parentPostal = parentPostal
        self.parentCity = parentCity
    }
    
}
