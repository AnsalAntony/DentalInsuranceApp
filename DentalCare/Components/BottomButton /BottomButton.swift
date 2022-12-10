//
//  BottomButton.swift
//  DentalCare
//
//  Created by Ansal Antony on 10/12/22.
//

import UIKit

@IBDesignable class BottomButton: UIButton {
    
    @IBInspectable var borderColor: UIColor = UIColor.black {
        didSet{
            self.layer.borderColor = borderColor.cgColor
           
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 3 {
        didSet{
            self.layer.borderWidth = borderWidth
           
        }
    }
    
    @IBInspectable var bgColor: UIColor = UIColor(red: 52.0/255.0, green: 120.0/255.0, blue: 246.0/255.0, alpha: 1) {
        didSet{
            self.backgroundColor = bgColor
           
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 5 {
        didSet{
            self.layer.cornerRadius = cornerRadius
           
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.masksToBounds = true
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.layer.masksToBounds = true
        commonInit()
    }

    private func commonInit(){
        self.backgroundColor = UIColor(red: 52.0/255.0, green: 120.0/255.0, blue: 246.0/255.0, alpha: 1)
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
    }
}

