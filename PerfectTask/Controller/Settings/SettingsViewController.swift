//
//  SettingsViewController.swift
//  PerfectTask
//
//  Created by Ahmed Nasr on 3/1/21.
//
import UIKit
import DropDown

class SettingsViewController: UIViewController {

    @IBOutlet weak var countryView: UIView!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var languageView: UIView!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var countryCodeView: UIView!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var trailingLabelConstrint: NSLayoutConstraint!
    @IBOutlet weak var topLabelConstraint: NSLayoutConstraint!
    @IBOutlet weak var topTextFieldConstraint: NSLayoutConstraint!
    @IBOutlet weak var leadingTextFieldConstraint: NSLayoutConstraint!
    @IBOutlet weak var trailingTextFieldConstraint: NSLayoutConstraint!
    @IBOutlet weak var topButtonConstraint: NSLayoutConstraint!
    @IBOutlet weak var topCountryLabelConstrint: NSLayoutConstraint!
    @IBOutlet weak var topCountryTextFieldConstrint: NSLayoutConstraint!
    @IBOutlet weak var topNumberLabelConstrint: NSLayoutConstraint!
    @IBOutlet weak var topLangLabelConstraint: NSLayoutConstraint!
    @IBOutlet weak var topNubmerTextFieldConstraint: NSLayoutConstraint!
    @IBOutlet weak var topLanguageTextFieldConstraint: NSLayoutConstraint!
    @IBOutlet weak var topPasswordLabelConstraint: NSLayoutConstraint!
    @IBOutlet weak var topPasswordTextFieldConstraint: NSLayoutConstraint!
    @IBOutlet weak var topEmailTextFieldConstrint: NSLayoutConstraint!
    @IBOutlet weak var topEmailLabelConstraint: NSLayoutConstraint!
    let countryDropDown = DropDown()
    let languageDropDown = DropDown()
    let countryCodeDropDown = DropDown()
    let arrOfCountry = ["مصر","السعوديه","الامارات","لبنان"]
    let arrOfLanguage = ["الانجليزية"," العربية"]
    let arrOfCodeCountry = ["+2","+829","+563","+987"]
    let arrOfFlagCountry = ["egypt","united-states","egypt","united-states"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCountryDropDownMenu()
        setUpLanguageDropDownMenu()
        setUpCountryCodeDropDownMenu()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    override func viewDidLayoutSubviews() {
        setUpConstraint()
    }
    func setUpConstraint(){
        let viewHeight = self.view.frame.height
        let viewWidth = self.view.frame.width
        topLabelConstraint.constant = viewHeight * 0.02
        trailingLabelConstrint.constant = viewWidth * 0.108
        leadingTextFieldConstraint.constant = viewWidth * 0.072
        trailingTextFieldConstraint.constant = viewWidth * 0.072
        topTextFieldConstraint.constant = viewHeight * 0.011
        topButtonConstraint.constant = viewHeight * 0.035
        topCountryLabelConstrint.constant = viewHeight * 0.022
        topNumberLabelConstrint.constant = viewHeight * 0.022
        topPasswordLabelConstraint.constant = viewHeight * 0.022
        topLangLabelConstraint.constant = viewHeight * 0.022
        topEmailLabelConstraint.constant = viewHeight * 0.022
        topCountryTextFieldConstrint.constant = viewHeight * 0.011
        topNubmerTextFieldConstraint.constant = viewHeight * 0.011
        topPasswordTextFieldConstraint.constant = viewHeight * 0.011
        topLanguageTextFieldConstraint.constant = viewHeight * 0.011
        topEmailTextFieldConstrint.constant = viewHeight * 0.011
    }
    func setUpCountryDropDownMenu(){
        countryView.layer.borderWidth = 0.5
        countryView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        countryDropDown.anchorView = countryView
        countryDropDown.dataSource = arrOfCountry
        countryDropDown.bottomOffset = CGPoint(x: 0, y:(countryDropDown.anchorView?.plainView.bounds.height)!)
        countryDropDown.topOffset = CGPoint(x: 0, y:-(countryDropDown.anchorView?.plainView.bounds.height)!)
        countryDropDown.direction = .bottom
        countryDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            countryLabel.text = item
        }
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showCountryMenu))
        countryView.addGestureRecognizer(gestureRecognizer)
    }
    @objc func showCountryMenu(){
        countryDropDown.show()
    }
    @IBAction func showCountryMenuOnClick(_ sender: UIButton) {
        countryDropDown.show()
    }
    func setUpLanguageDropDownMenu(){
        languageView.layer.borderWidth = 0.5
        languageView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        languageDropDown.anchorView = languageView
        languageDropDown.dataSource = arrOfLanguage
        languageDropDown.bottomOffset = CGPoint(x: 0, y:(languageDropDown.anchorView?.plainView.bounds.height)!)
        languageDropDown.topOffset = CGPoint(x: 0, y:-(languageDropDown.anchorView?.plainView.bounds.height)!)
        languageDropDown.direction = .bottom
        languageDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            languageLabel.text = item
        }
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showLanguageMenu))
        languageView.addGestureRecognizer(gestureRecognizer)
    }
    @objc func showLanguageMenu(){
        languageDropDown.show()
    }
    @IBAction func showLanguageMenuOnClick(_ sender: UIButton) {
        languageDropDown.show()
    }
    func setUpCountryCodeDropDownMenu(){
        countryCodeView.layer.borderWidth = 0.5
        countryCodeView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        countryCodeDropDown.cellNib = UINib(nibName: "CountryCodeDropDownCell", bundle: nil)
        countryCodeDropDown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
            guard let cell = cell as? CountryCodeDropDownCell else { return }
            cell.countryFlagImageView.image = UIImage(named: self.arrOfFlagCountry[index])
        }
        countryCodeDropDown.anchorView = countryCodeView
        countryCodeDropDown.dataSource = arrOfCodeCountry
        countryCodeDropDown.bottomOffset = CGPoint(x: 0, y:(countryCodeDropDown.anchorView?.plainView.bounds.height)!)
        countryCodeDropDown.topOffset = CGPoint(x: 0, y:-(countryCodeDropDown.anchorView?.plainView.bounds.height)!)
        countryCodeDropDown.direction = .bottom
        countryCodeDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            codeLabel.text = item
        }
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showCountryCodeMenu))
        countryCodeView.addGestureRecognizer(gestureRecognizer)
    }
    @objc func showCountryCodeMenu(){
        countryCodeDropDown.show()
    }
    @IBAction func showCountryCodeMenuOnClick(_ sender: Any) {
        countryCodeDropDown.show()
    }
}
