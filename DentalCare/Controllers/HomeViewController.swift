//
//  HomeViewController.swift
//  DentalCare
//
//  Created by Ansal Antony on 11/12/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var insuranceTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUi()
        setupNib()
    }
    
    private func setUpUi(){
        navigationItem.title = Constants.dentalCare
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self, action: #selector(addTodoItem))
    }
    
    private func setupNib(){
        
        insuranceTableView.register(UINib(nibName: Constants.nibId.insuranceTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.nibId.insuranceTableViewCell)
    }
    
    @objc func addTodoItem() {
        //        let viewController = ManageToDoViewController.make()
        //        viewController.delegate = self
        //        navigationController?.present(viewController, animated: true)
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
        //        let viewController = ManageToDoViewController.make()
        //        viewController.delegate = self
        //        viewController.todoItem = homeViewModel.todoItems[indexPath.row]
        //        navigationController?.present(viewController, animated: true)
    }
    
}
