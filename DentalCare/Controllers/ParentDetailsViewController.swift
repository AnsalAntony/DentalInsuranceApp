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
        
    }
    @objc func motherClicked(sender: UIButton) {
        motherTextField.isChecked = !motherTextField.isChecked
        
    }
    @objc func guardianClicked(sender: UIButton) {
        guardianCheckBox.isChecked = !guardianCheckBox.isChecked
        
    }
    @objc func otherClicked(sender: UIButton) {
        otherCheckBox.isChecked = !otherCheckBox.isChecked
        
    }
    
    
    @IBAction func saveClicked(_ sender: Any) {
        let viewController = BankDetailsViewController.make()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    
}
