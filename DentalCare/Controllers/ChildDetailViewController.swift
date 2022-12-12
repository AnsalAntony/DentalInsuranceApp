//
//  ChildDetailViewController.swift
//  DentalCare
//
//  Created by Ansal Antony on 10/12/22.
//

import UIKit

class ChildDetailViewController: UIViewController {
    
    @IBOutlet weak var cardViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var cardViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var postalTextField: UITextField!
    @IBOutlet weak var streetTextField: UITextField!
    @IBOutlet weak var houseNumberTextField: UITextField!
    @IBOutlet weak var otherGenderCheckBox: CheckBox!
    @IBOutlet weak var femailCheckBox: CheckBox!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var personalNumberTextField: UITextField!
    @IBOutlet weak var cardView: CardView!
    @IBOutlet weak var maleCheckBox: CheckBox!
    private let chieldDetailViewModel = ChieldDetailViewModel()
    private var genderSelection = ""
    
    
    static func make() -> ChildDetailViewController {
        let viewController = UIStoryboard(name: "ChieldDetail", bundle: nil).instantiateViewController(withIdentifier: Constants.storyboardId.childDetailViewController) as! ChildDetailViewController
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupUi()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        cardView.fadeIn()
        cardView.isHidden = false
        
    }
    private func setupUi(){
        cardView.fadeOut()
        cardView.isHidden = true // for displaying animation properlly
        maleCheckBox.checkSelectionBtn.addTarget(self, action: #selector(maleButtonClicked), for: .touchUpInside)
        femailCheckBox.checkSelectionBtn.addTarget(self, action: #selector(femaileButtonClicked), for: .touchUpInside)
        otherGenderCheckBox.checkSelectionBtn.addTarget(self, action: #selector(otherGenderButtonClicked), for: .touchUpInside)
        if(!UIDevice.current.hasNotch){
            cardViewTopConstraint.constant = Constants.cardViewTopConstraint
            cardViewBottomConstraint.constant = Constants.cardViewBottomConstraint
        }
    }
    
    private func setupNavigationBar(){
        
        navigationItem.title = Constants.childDetails
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @objc func maleButtonClicked(sender: UIButton) {
        maleCheckBox.isChecked = !maleCheckBox.isChecked
        femailCheckBox.isChecked = false
        otherGenderCheckBox.isChecked = false
        genderSelection = chieldDetailViewModel.manageGender(gender: "M", selection: maleCheckBox.isChecked)
        
    }
    @objc func femaileButtonClicked(sender: UIButton) {
        femailCheckBox.isChecked = !femailCheckBox.isChecked
        maleCheckBox.isChecked = false
        otherGenderCheckBox.isChecked = false
        genderSelection = chieldDetailViewModel.manageGender(gender: "F", selection: femailCheckBox.isChecked)
        
        
    }
    @objc func otherGenderButtonClicked(sender: UIButton) {
        otherGenderCheckBox.isChecked = !otherGenderCheckBox.isChecked
        maleCheckBox.isChecked = false
        femailCheckBox.isChecked = false
        genderSelection = chieldDetailViewModel.manageGender(gender: "O", selection: otherGenderCheckBox.isChecked)
    }
    
    @IBAction func parentDetailClicked(_ sender: Any) {
        
        let validateChieldDetails = chieldDetailViewModel.validateChieldDetails(personalNumber: personalNumberTextField.text ?? "", name: nameTextField.text ?? "", age: ageTextField.text ?? "", gender: genderSelection, house: houseNumberTextField.text ?? "", street: streetTextField.text ?? "", post: postalTextField.text ?? "" , city: cityTextField.text ?? "")
        
        if(!validateChieldDetails.status && validateChieldDetails.message != ""){
            alertPresent(title: "", message: validateChieldDetails.message)
        }else{
            // save chield details to the data base or call the post api
            // in the sucess block naviagte to the next view cintroller.
            let viewController = ParentDetailsViewController.make()
            navigationController?.pushViewController(viewController, animated: true)

        }

    }
    
}
