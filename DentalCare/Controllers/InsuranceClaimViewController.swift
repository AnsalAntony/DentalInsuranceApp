//
//  InsuranceClaimViewController.swift
//  DentalCare
//
//  Created by Ansal Antony on 11/12/22.
//

import UIKit

protocol ManageClaimDelegate: AnyObject {
    func registerClaim(message: String)
}

class InsuranceClaimViewController: UIViewController {

    
    @IBOutlet weak var yesCheckBox: CheckBox!
    @IBOutlet weak var noCheckBox: CheckBox!
    @IBOutlet weak var silverCheckBox: CheckBox!
    @IBOutlet weak var goldCheckBox: CheckBox!
    @IBOutlet weak var platinumCheckBox: CheckBox!
    @IBOutlet weak var diamondCheckBox: CheckBox!
    @IBOutlet weak var reasonTextView: UITextView!
    @IBOutlet weak var policeNumberTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    weak var delegate: ManageClaimDelegate?
    
    static func make() -> InsuranceClaimViewController {
        let viewController = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: Constants.storyboardId.insuranceClaimViewController) as! InsuranceClaimViewController
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
   
    @IBAction func registerClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        delegate?.registerClaim(message: Constants.claimRegisteredSuccessfully)
    }
}
