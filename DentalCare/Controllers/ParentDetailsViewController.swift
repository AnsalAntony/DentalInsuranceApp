//
//  ParentDetailsViewController.swift
//  DentalCare
//
//  Created by Ansal Antony on 11/12/22.
//

import UIKit

class ParentDetailsViewController: UIViewController {
    
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var postalcodeTextField: UITextField!
    @IBOutlet weak var streetTextField: UITextField!
    @IBOutlet weak var houseTextField: UITextField!
    @IBOutlet weak var otherCheckBox: CheckBox!
    @IBOutlet weak var guardianCheckBox: CheckBox!
    @IBOutlet weak var motherTextField: CheckBox!
    @IBOutlet weak var fatherCheckBox: CheckBox!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var personalNumberTextField: UITextField!
    @IBOutlet weak var cardView: CardView!
    @IBOutlet weak var cardViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var cardViewBottomConstraint: NSLayoutConstraint!
    
    private let parentDetailsViewModel = ParentDetailsViewModel()
    private var selectedReleationShip = ""
    
    static func make() -> ParentDetailsViewController {
        let viewController = UIStoryboard(name: "ParentDetail", bundle: nil).instantiateViewController(withIdentifier: Constants.storyboardId.parentDetailsViewController) as! ParentDetailsViewController
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUi()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        cardView.fadeIn()
        cardView.isHidden = false
        
    }
    
    private func setupUi(){
        cardView.fadeOut()
        cardView.isHidden = true // displaying animation
        navigationItem.title = Constants.parentDetails
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        fatherCheckBox.checkSelectionBtn.addTarget(self, action: #selector(fatherClicked), for: .touchUpInside)
        motherTextField.checkSelectionBtn.addTarget(self, action: #selector(motherClicked), for: .touchUpInside)
        guardianCheckBox.checkSelectionBtn.addTarget(self, action: #selector(guardianClicked), for: .touchUpInside)
        otherCheckBox.checkSelectionBtn.addTarget(self, action: #selector(otherClicked), for: .touchUpInside)
        
        if(!UIDevice.current.hasNotch){
            cardViewTopConstraint.constant = Constants.cardViewTopConstraint
            cardViewBottomConstraint.constant = Constants.cardViewBottomConstraint
        }
    }
    
    @objc func fatherClicked(sender: UIButton) {
        fatherCheckBox.isChecked = !fatherCheckBox.isChecked
        motherTextField.isChecked = false
        guardianCheckBox.isChecked = false
        otherCheckBox.isChecked = false
        selectedReleationShip = parentDetailsViewModel.manageReletationShip(reletationShip: "Father", selection: fatherCheckBox.isChecked)
    }
    @objc func motherClicked(sender: UIButton) {
        fatherCheckBox.isChecked = false
        motherTextField.isChecked = !motherTextField.isChecked
        guardianCheckBox.isChecked = false
        otherCheckBox.isChecked = false
        selectedReleationShip = parentDetailsViewModel.manageReletationShip(reletationShip: "Mother", selection: motherTextField.isChecked)
        
    }
    @objc func guardianClicked(sender: UIButton) {
        fatherCheckBox.isChecked = false
        motherTextField.isChecked = false
        guardianCheckBox.isChecked = !guardianCheckBox.isChecked
        otherCheckBox.isChecked = false
        selectedReleationShip = parentDetailsViewModel.manageReletationShip(reletationShip: "Guardian", selection: guardianCheckBox.isChecked)
        
    }
    @objc func otherClicked(sender: UIButton) {
        fatherCheckBox.isChecked = false
        motherTextField.isChecked = false
        guardianCheckBox.isChecked = false
        otherCheckBox.isChecked = !otherCheckBox.isChecked
        selectedReleationShip = parentDetailsViewModel.manageReletationShip(reletationShip: "Other", selection: otherCheckBox.isChecked)
    }
    
    
    @IBAction func saveClicked(_ sender: Any) {
        
        let validateParentDetails = parentDetailsViewModel.parentDetails(personalNumber: personalNumberTextField.text ?? "", name: nameTextField.text ?? "", email: emailAddressTextField.text ?? "", mobile: mobileNumberTextField.text ?? "", releation: selectedReleationShip, house: houseTextField.text ?? "", street: streetTextField.text ?? "", post: postalcodeTextField.text ?? "", city: cityTextField.text ?? "")
        
        
        if(!validateParentDetails.status && validateParentDetails.message != ""){
            alertPresent(title: "", message: validateParentDetails.message)
        }else{
            // save parent details to the data base or call the post api
            // in the sucess block naviagte to the next view controller.
            
            let viewController = BankDetailsViewController.make()
            navigationController?.pushViewController(viewController, animated: true)

        }
    }
    
    
}
