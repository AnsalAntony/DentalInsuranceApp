//
//  UIView+Extensions.swift
//  DentalCare
//
//  Created by Ansal Antony on 10/12/22.
//

import Foundation
import UIKit

extension UIView {
    // MARK: - craeting shado for view
    func setBackgroundShadow(setColor: UIColor) {
        //MARK:- Shade a view
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: -1, height: 1.0)
        self.layer.shadowRadius = 5
        self.layer.shadowColor = setColor.cgColor
        self.layer.masksToBounds = false
    }
    
    // MARK: - loading nib for creating custome components.
    func loadViewFromNib(nibName: String) -> UIView{
        let view = Bundle.main.loadNibNamed(nibName, owner: self, options: nil)?[0] as! UIView
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.frame = self.bounds
        return view
    }
}
