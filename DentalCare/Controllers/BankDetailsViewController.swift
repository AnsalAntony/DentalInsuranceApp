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

}
