//
//  InsuranceTableViewCell.swift
//  DentalCare
//
//  Created by Ansal Antony on 11/12/22.
//

import UIKit

class InsuranceTableViewCell: UITableViewCell {

    @IBOutlet weak var cardView: CardView!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var planLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        statusView.layer.cornerRadius = statusView.frame.height/2
        statusView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

