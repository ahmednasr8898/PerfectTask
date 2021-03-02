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
    var menu: SideMenuNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigation()
        setUpDesign()
        setUpMenu()
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

