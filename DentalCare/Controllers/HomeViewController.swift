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
    
    private let homeViewModel =  HomeViewModel()
    private var homeViewModelDisplay =  HomeViewModel()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUi()
        setupNib()
        takeClaim()
    }
    
    private func takeClaim(){
        homeViewModel.takeItems {
            homeViewModelDisplay = homeViewModel
            insuranceTableView.reloadData()
        }
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
    
    @IBAction func statusSegumentClicked(_ sender: Any) {
        if(self.statusSegument.selectedSegmentIndex == 0){
            takeClaim()
        }
        if(self.statusSegument.selectedSegmentIndex == 1){
            homeViewModelDisplay.claimModel = []
            insuranceTableView.reloadData()
        }
        if(self.statusSegument.selectedSegmentIndex == 2){
            homeViewModelDisplay.claimModel = []
            insuranceTableView.reloadData()
        }
    }
        
    
}

// MARK: Table view Data source

extension HomeViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.claimModel.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.insuranceTableView.dequeueReusableCell(withIdentifier: Constants.nibId.insuranceTableViewCell, for: indexPath) as! InsuranceTableViewCell
        let claimModel = homeViewModel.claimModel[indexPath.row]
        cell.configureCell(insuranceClaimModel: claimModel)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

extension HomeViewController: ManageClaimDelegate {
    func registerClaim(message: String){
        alertPresent(title: "", message: message)
        takeClaim()
    }
}
