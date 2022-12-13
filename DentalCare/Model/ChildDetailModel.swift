//
//  ChildDetailModel.swift
//  DentalCare
//
//  Created by Ansal Antony on 13/12/22.
//

import Foundation
import RealmSwift

class ChildDetailModel: Object {
    
    @Persisted @objc var personalNumber: String?
    @Persisted @objc var name: String?
    @Persisted @objc var age: String?
    @Persisted @objc var gender: String?
    @Persisted @objc var house: String?
    @Persisted @objc var street: String?
    @Persisted @objc var postal: String?
    @Persisted @objc var city: String?
    @objc dynamic var parentDetail: ParentDetailModel?
    @objc dynamic var bankDetail: BankDetailModel?
    let insuranceClaim = List<InsuranceClaimModel>()
    //@objc dynamic var insuranceClaim = [InsuranceClaimModel]()
    
    convenience init(personalNumber: String, name: String, age: String, gender: String, house: String, street:String, postal: String, city: String){
        self.init()
        self.personalNumber = personalNumber
        self.name = name
        self.age = age
        self.gender = gender
        self.house = house
        self.street = street
        self.postal = postal
        self.city = city
    }
    
}
