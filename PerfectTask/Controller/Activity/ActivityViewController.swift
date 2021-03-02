//
//  ActivityViewController.swift
//  PerfectTask
//
//  Created by Ahmed Nasr on 3/2/21.
//

import UIKit

class ActivityViewController: UIViewController {
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDesign()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    func setUpDesign(){
        firstView.setUpBiggerView()
        secondView.setUpBiggerView()
        thirdView.setUpBiggerView()
    }
}

