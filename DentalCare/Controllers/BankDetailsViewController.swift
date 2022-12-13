//
//  BankDetailsViewController.swift
//  DentalCare
//
//  Created by Ansal Antony on 11/12/22.
//

import UIKit

class BankDetailsViewController: UIViewController {

    @IBOutlet weak var bankIdTextField: UITextField!
    @IBOutlet weak var cardView: CardView!
    @IBOutlet weak var bankNameTextField: UITextField!
    @IBOutlet weak var accountTextField: UITextField!
    
    private let bankDetailsViewModel = BankDetailsViewModel()
    
    static func make() -> BankDetailsViewController {
        let viewController = UIStoryboard(name: "BankDetail", bundle: nil).instantiateViewController(withIdentifier: Constants.storyboardId.bankDetailsViewController) as! BankDetailsViewController
        return viewController
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardView.fadeOut()
        cardView.isHidden = true // displaying animation
        navigationItem.title = Constants.bankDetails
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        cardView.fadeIn()
        cardView.isHidden = false
        
    }

    @IBAction func saveClicked(_ sender: Any) {
        let checkBankDetails = bankDetailsViewModel.validateBankDetails(bankId: bankIdTextField.text ?? "", accountNumber: accountTextField.text ?? "", bankName: bankNameTextField.text ?? "")
        
        if(!checkBankDetails.status && checkBankDetails.message != ""){
            alertPresent(title: "", message: checkBankDetails.message)
        }else{
            // save bank details to the data base or call the post api
            // in the sucess block naviagte to the next view controller.
            
            let viewController = BankDetailsViewController.make()
            navigationController?.pushViewController(viewController, animated: true)

        }
        
        let homeViewController = HomeViewController.make()
        guard let navigationController = navigationController else { return }
        navigationController.setViewControllers([homeViewController], animated: false)
    }
}
