//
//  ChildTableViewCell.swift
//  PerfectTask
//
//  Created by Ahmed Nasr on 3/1/21.
//
import UIKit

class ChildTableViewCell: UITableViewCell {

    @IBOutlet weak var childImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var childView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        childView.layer.borderWidth = 0.8
        childView.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        childView.layer.cornerRadius = 10
    }
}
