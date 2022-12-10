//
//  TextFieldHoldingView.swift
//  DentalCare
//
//  Created by Ansal Antony on 10/12/22.
//

import UIKit

@IBDesignable class TextFieldHoldingView: UIView {

   
    @IBInspectable var bgColor: UIColor = UIColor.white{
        didSet {
            self.backgroundColor = bgColor
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.lightGray{
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0.5{
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 5{
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 5
        self.backgroundColor = UIColor.white
        self.layer.masksToBounds = true
        
    }
    
}
