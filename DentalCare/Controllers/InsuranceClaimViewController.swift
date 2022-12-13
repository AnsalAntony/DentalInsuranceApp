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
    let datePicker = UIDatePicker()
    private var selectedDate = ""
    private var selectedPlan = ""
    private var selectedClaimString = ""
    private var selectedClaimBool = false
    private let insuranceClaimViewModel = InsuranceClaimViewModel()
    
    
    static func make() -> InsuranceClaimViewController {
        let viewController = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: Constants.storyboardId.insuranceClaimViewController) as! InsuranceClaimViewController
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
        createDatePicker()
    }
    
    private func createDatePicker(){
        
        datePicker.frame.size = CGSize(width: 0, height: 150)
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Date()
        let toolBarDatePicker = UIToolbar()
        toolBarDatePicker.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(dateSelected))
        toolBarDatePicker.setItems([doneButton], animated: true)
        dateTextField.inputAccessoryView = toolBarDatePicker
        dateTextField.inputView = datePicker
    }
    @objc func dateSelected() {
        dateTextField.text = Formaters.shared.formateDateTime(dateTime: datePicker.date, formate: Constants.formateTodoDate)
        selectedDate = "\(datePicker.date)"
        self.view.endEditing(true)
    }
    
    private func setupUi(){
        reasonTextView.setTextViewPlaceholder(placeHolderText:Constants.injurieReason)
        diamondCheckBox.checkSelectionBtn.addTarget(self, action: #selector(diamondClicked), for: .touchUpInside)
        platinumCheckBox.checkSelectionBtn.addTarget(self, action: #selector(platinumClicked), for: .touchUpInside)
        goldCheckBox.checkSelectionBtn.addTarget(self, action: #selector(goldnClicked), for: .touchUpInside)
        silverCheckBox.checkSelectionBtn.addTarget(self, action: #selector(silverClicked), for: .touchUpInside)
        yesCheckBox.checkSelectionBtn.addTarget(self, action: #selector(yesClicked), for: .touchUpInside)
        noCheckBox.checkSelectionBtn.addTarget(self, action: #selector(noClicked), for: .touchUpInside)
    }
    @objc func diamondClicked(sender: UIButton) {
        diamondCheckBox.isChecked = !diamondCheckBox.isChecked
        platinumCheckBox.isChecked = false
        goldCheckBox.isChecked = false
        silverCheckBox.isChecked = false
        selectedPlan = insuranceClaimViewModel.managePlan(plan: Constants.diamond, selection: diamondCheckBox.isChecked)
    }
    @objc func platinumClicked(sender: UIButton) {
        diamondCheckBox.isChecked = false
        platinumCheckBox.isChecked = !platinumCheckBox.isChecked
        goldCheckBox.isChecked = false
        silverCheckBox.isChecked = false
        selectedPlan = insuranceClaimViewModel.managePlan(plan: Constants.platinum, selection: platinumCheckBox.isChecked)
    }
    @objc func goldnClicked(sender: UIButton) {
        diamondCheckBox.isChecked = false
        platinumCheckBox.isChecked = false
        goldCheckBox.isChecked = !goldCheckBox.isChecked
        silverCheckBox.isChecked = false
        selectedPlan = insuranceClaimViewModel.managePlan(plan: Constants.gold, selection: goldCheckBox.isChecked)
    }
    @objc func silverClicked(sender: UIButton) {
        diamondCheckBox.isChecked = false
        platinumCheckBox.isChecked = false
        goldCheckBox.isChecked = false
        silverCheckBox.isChecked = !silverCheckBox.isChecked
        selectedPlan = insuranceClaimViewModel.managePlan(plan: Constants.silver, selection: silverCheckBox.isChecked)
        
    }
    @objc func noClicked(sender: UIButton) {
        noCheckBox.isChecked = !noCheckBox.isChecked
        yesCheckBox.isChecked = false
        selectedClaimString = insuranceClaimViewModel.manageOtherClaim(claim: Constants.falseVal, selection: noCheckBox.isChecked)
        selectedClaimBool = false
    }
    @objc func yesClicked(sender: UIButton) {
        yesCheckBox.isChecked = !yesCheckBox.isChecked
        noCheckBox.isChecked = false
        selectedClaimString = insuranceClaimViewModel.manageOtherClaim(claim: Constants.trueVal, selection: yesCheckBox.isChecked)
        selectedClaimBool = true
    }
    
    @IBAction func registerClicked(_ sender: Any) {
        
        let ClaimValidation = insuranceClaimViewModel.InsuranceClaimValidation(pollicyNumber: policeNumberTextField.text ?? "", date: dateTextField.text ?? "", reason: reasonTextView.text ?? "", paln: selectedPlan, otherClaimStr: selectedClaimString, otherClaimBool: selectedClaimBool)
        
        if(!ClaimValidation.status && ClaimValidation.message != ""){
            alertPresent(title: "", message: ClaimValidation.message)
        }else{
            // save claim details to the data base or call the post api
            // in the sucess block dismiss this  view controller and show message.
            
            insuranceClaimViewModel.saveInsuranceClaim(pollicyNumber: policeNumberTextField.text ?? "", date: dateTextField.text ?? "", reason: reasonTextView.text ?? "", plan: selectedPlan, otherClaimBool: selectedClaimBool) { [weak self] success, message in
                DispatchQueue.main.async {
                    if(success){
                        self?.dismiss(animated: true, completion: nil)
                        self?.delegate?.registerClaim(message: Constants.claimRegisteredSuccessfully)
                    }else{
                        self?.alertPresent(title: "", message: message)
                    }
                   
                }
            }
            
        }
       
    }
}
extension InsuranceClaimViewController : UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        reasonTextView.checkTextViewPlaceholder()
    }
}
