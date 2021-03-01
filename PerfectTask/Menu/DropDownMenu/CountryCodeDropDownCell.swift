//
//  CountryCodeDropDownCell.swift
//  PerfectTask
//
//  Created by Ahmed Nasr on 3/2/21.
//
import UIKit
import DropDown

class CountryCodeDropDownCell: DropDownCell {

    @IBOutlet weak var countryFlagImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
