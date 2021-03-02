//
//  ProfileViewController.swift
//  PerfectTask
//
//  Created by Ahmed Nasr on 3/2/21.
//
import UIKit
import Kingfisher
import DropDown

class ProfileViewController: UIViewController {

    @IBOutlet weak var genderView: UIView!
    @IBOutlet weak var ageView: UIView!
    @IBOutlet weak var techView: UIView!
    @IBOutlet weak var activityView: UIView!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    var userName: String?
    var imagePath: String?
    let genderDropDown = DropDown()
    let arrOfGender = ["ذكر","انثي"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigation()
        setUpGenderDropDownMenu()
        setUpUserImage()
        setUpDesign()
    }
    func setUpNavigation(){
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    func setUpDesign(){
        genderView.setUpProfileView()
        ageView.setUpProfileView()
        techView.setUpProfileView()
        activityView.setUpProfileView()
    }
    func setUpUserImage(){
        userNameLabel.text = userName
        if let url = URL(string: imagePath ?? ""){ self.userImageView.kf.setImage(with: url) }
        userImageView.layer.cornerRadius = userImageView.frame.height / 2
        userImageView.clipsToBounds = true
    }
    func setUpGenderDropDownMenu(){
        genderView.layer.borderWidth = 0.5
        genderView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        genderDropDown.anchorView = genderView
        genderDropDown.dataSource = arrOfGender
        genderDropDown.bottomOffset = CGPoint(x: 0, y:(genderDropDown.anchorView?.plainView.bounds.height)!)
        genderDropDown.topOffset = CGPoint(x: 0, y:-(genderDropDown.anchorView?.plainView.bounds.height)!)
        genderDropDown.direction = .bottom
        genderDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            genderLabel.text = item
        }
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showCountryMenu))
        genderView.addGestureRecognizer(gestureRecognizer)
    }
    @objc func showCountryMenu(){
        genderDropDown.show()
    }
    @IBAction func showGenderMenuOnClick(_ sender: Any) {
        genderDropDown.show()
    }
}
