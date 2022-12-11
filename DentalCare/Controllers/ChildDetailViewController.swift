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
        cardView.isHidden = true // displaying animation
        maleCheckBox.checkSelectionBtn.addTarget(self, action: #selector(maleButtonClicked), for: .touchUpInside)
        femailCheckBox.checkSelectionBtn.addTarget(self, action: #selector(femaileButtonClicked), for: .touchUpInside)
        otherGenderCheckBox.checkSelectionBtn.addTarget(self, action: #selector(otherGenderButtonClicked), for: .touchUpInside)
        if(!UIDevice.current.hasNotch){
            cardViewTopConstraint.constant = Constants.cardViewTopConstraint
            cardViewBottomConstraint.constant = Constants.cardViewBottomConstraint
        }
    }
    
    private func setupNavigationBar(){
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            appearance.backgroundColor = UIColor.clear
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
        
        UINavigationBar.appearance().tintColor = .white
        navigationItem.title = Constants.childDetails
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @objc func maleButtonClicked(sender: UIButton) {
        maleCheckBox.isChecked = !maleCheckBox.isChecked
        
    }
    @objc func femaileButtonClicked(sender: UIButton) {
        femailCheckBox.isChecked = !femailCheckBox.isChecked
        
    }
    @objc func otherGenderButtonClicked(sender: UIButton) {
        otherGenderCheckBox.isChecked = !otherGenderCheckBox.isChecked
        
    }
    
    @IBAction func parentDetailClicked(_ sender: Any) {
    }
    
}
