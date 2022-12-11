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
        //        cardView.fadeOut(completion: {
        //            (finished: Bool) -> Void in
        //            self.ButtonRegister.isHidden = true
        //        })
        
    }
    
    @IBAction func registerClicked(_ sender: Any) {
        
    }
}


