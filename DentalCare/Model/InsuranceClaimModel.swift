//
//  InsuranceClaimModel.swift
//  DentalCare
//
//  Created by Ansal Antony on 13/12/22.
//

import Foundation
import RealmSwift

class InsuranceClaimModel: Object {
    
    @Persisted @objc var policyNumber: String?
    @Persisted @objc var dateInjury: String?
    @Persisted @objc var reasonInjury: String?
    @Persisted @objc var insurancePlan: String?
    @Persisted @objc var otherClaim = Bool()
    
    convenience init(policyNumber: String, dateInjury: String, reasonInjury: String, insurancePlan: String, otherClaim: Bool){
        self.init()
        self.policyNumber = policyNumber
        self.dateInjury = dateInjury
        self.reasonInjury = reasonInjury
        self.insurancePlan = insurancePlan
        self.otherClaim = otherClaim
    }
    
}
