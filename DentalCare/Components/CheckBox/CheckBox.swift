//
//  CheckBox.swift
//  DentalCare
//
//  Created by Ansal Antony on 10/12/22.
//

import Foundation
import UIKit

@IBDesignable class CheckBox: UIView {
    
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var checkSelectionBtn: UIButton!
    @IBOutlet weak var checkView: UIView!
    @IBOutlet weak var unCheckView: UIView!
    
    // Bool property
    var isChecked: Bool = false {
        didSet {
            if isChecked == true {
                self.checkView.isHidden = false
            } else {
                self.checkView.isHidden = true
            }
        }
    }
    
    var unCheckViewCornerRadius: CGFloat = 0 {
        didSet {
            unCheckView.layer.cornerRadius = unCheckViewCornerRadius
            
        }
    }
    
    var checkViewCornerRadius: CGFloat = 0 {
        didSet {
            checkView.layer.cornerRadius = checkViewCornerRadius
            
        }
    }
    var unCheckViewBgColor: UIColor = UIColor.lightGray {
        didSet {
            unCheckView.backgroundColor = unCheckViewBgColor
            
        }
    }
    
    var checkViewBgColor: UIColor = UIColor.white {
        didSet {
            checkView.backgroundColor = checkViewBgColor
            
        }
    }
    
    var unCheckViewBorderWidth: CGFloat = 0 {
        didSet {
            unCheckView.layer.borderWidth = unCheckViewBorderWidth
            
        }
    }
    
    var checkViewBorderWidth: CGFloat = 0 {
        didSet {
            checkView.layer.borderWidth = checkViewBorderWidth
            
        }
    }
    
    var unCheckViewBorderColor: UIColor = UIColor.lightGray {
        didSet {
            unCheckView.layer.borderColor = unCheckViewBorderColor.cgColor
            
        }
    }
    
    var checkViewBorderColor: UIColor = UIColor.white {
        didSet {
            checkView.layer.borderColor = checkViewBorderColor.cgColor
            
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        setUpUi()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        setUpUi()
    }
    
    private func commonInit(){
        parentView = loadViewFromNib(nibName: "CheckBox")
        addSubview(parentView)
    }
    
    private func setUpUi(){
        unCheckViewBgColor = UIColor.lightGray
        checkViewBgColor = UIColor.white
        checkSelectionBtn.setTitle("", for: .normal)
        
        unCheckViewCornerRadius = 4
        unCheckView.layer.masksToBounds = true
        checkViewCornerRadius = 3
        checkView.layer.masksToBounds = true
        
        isChecked = false
    }
    
}
