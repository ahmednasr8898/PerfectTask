//
//  ActivityViewController.swift
//  PerfectTask
//
//  Created by Ahmed Nasr on 3/2/21.
//
import UIKit
import SideMenu

class ActivityViewController: UIViewController {
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var topFirstViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var leadingViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var trailingViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var topSecondViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var topThirdViewConstraint: NSLayoutConstraint!
    var menu: SideMenuNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigation()
        setUpDesign()
        setUpMenu()
    }
    override func viewDidLayoutSubviews() {
        setUpConstraint()
    }
    func setUpNavigation(){
        let logo = UIImage(named: "bin")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    func setUpDesign(){
        firstView.setUpBiggerView()
        secondView.setUpBiggerView()
        thirdView.setUpBiggerView()
    }
    func setUpConstraint(){
        let viewHeight = self.view.frame.height
        let viewWidth = self.view.frame.width
        topFirstViewConstraint.constant = viewHeight * 0.027
        topSecondViewConstraint.constant = viewHeight * 0.040
        topThirdViewConstraint.constant = viewHeight * 0.040
        leadingViewConstraint.constant = viewWidth * 0.048
        trailingViewConstraint.constant = viewWidth * 0.048
    }
    func setUpMenu(){
        menu = SideMenuNavigationController(rootViewController: MenuViewController())
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        menu?.leftSide = true
    }
    @IBAction func showSideMenuOnClick(_ sender: UIBarButtonItem) {
        present(menu!, animated: true)
    }
}

