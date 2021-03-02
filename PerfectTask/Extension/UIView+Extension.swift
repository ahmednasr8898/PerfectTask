//
//  UIView+Extension.swift
//  PerfectTask
//
//  Created by Ahmed Nasr on 3/2/21.
//
import Foundation
import UIKit
extension UIView{
    func setUpBiggerView(){
        self.backgroundColor = #colorLiteral(red: 0.9731277823, green: 0.9496404529, blue: 0.980337441, alpha: 1)
        self.layer.cornerRadius = 10
        self.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.layer.borderWidth = 0.4
    }
    func setUpProfileView(){
        self.layer.borderWidth = 0.5
        self.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.layer.cornerRadius = 8
    }
    func setUpView(backgroundColor: UIColor?, cornerRadius: CGFloat?, borderColor: CGColor?, borderWidth: CGFloat?){
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius ?? 0
        self.layer.borderColor = borderColor
        self.layer.borderWidth = borderWidth ?? 0
    }
}
