//
//  HomeViewController.swift
//  DentalCare
//
//  Created by Ansal Antony on 11/12/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var statusSegument: UISegmentedControl!
    @IBOutlet weak var insuranceTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUi()
        setupNib()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        mainView.fadeIn()
    }
    
    static func make() -> HomeViewController {
        let viewController = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: Constants.storyboardId.homeViewController) as! HomeViewController
        return viewController
    }
    
    private func setUpUi(){
        mainView.fadeOut()
        navigationItem.title = Constants.dentalCare
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self, action: #selector(addClaim))
    }
    
    private func setupNib(){
        
        insuranceTableView.register(UINib(nibName: Constants.nibId.insuranceTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.nibId.insuranceTableViewCell)
    }
    
    @objc func addClaim() {
        let viewController = InsuranceClaimViewController.make()
        viewController.delegate = self
        navigationController?.present(viewController, animated: true)
    }
    
}

// MARK: Table view Data source

extension HomeViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.insuranceTableView.dequeueReusableCell(withIdentifier: Constants.nibId.insuranceTableViewCell, for: indexPath) as! InsuranceTableViewCell
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

extension HomeViewController: ManageClaimDelegate {
    func registerClaim(message: String){
        alertPresent(title: "", message: message)
    }
}
