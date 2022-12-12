//
//  LoginViewController.swift
//  DentalCare
//
//  Created by Ansal Antony on 09/12/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textPersonalNumber: UITextField!
    @IBOutlet weak var cardView: CardView!
    private let loginViewModel = LoginViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView(){
        labelTitle.fadeOut()
        labelDescription.fadeOut()
        cardView.fadeOut()
       
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            appearance.backgroundColor = UIColor.clear
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
        UINavigationBar.appearance().tintColor = .white
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        labelTitle.fadeIn()
        labelDescription.fadeIn()
        cardView.fadeIn()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func loginClicked(_ sender: Any) {
        
        let validateLogin = loginViewModel.validateLogin(personalNumber: textPersonalNumber.text ?? "", name: textName.text ?? "")
        
        if(!validateLogin.status && validateLogin.message != ""){
            alertPresent(title: "", message: validateLogin.message)
        }else{
            // check chield personal number and name in the data base go inside
            // if chiled not in the data base show the errro message "chield not regesterd please regester your chield details"
            
            let homeViewController = HomeViewController.make()
            guard let navigationController = navigationController else { return }
            navigationController.setViewControllers([homeViewController], animated: false)
        }
        
    }
    
    @IBAction func registerClicked(_ sender: Any) {
        let viewController = ChildDetailViewController.make()
        navigationController?.pushViewController(viewController, animated: true)
    }
}


