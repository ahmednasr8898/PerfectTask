//
//  ViewController.swift
//  PerfectTask
//
//  Created by Ahmed Nasr on 3/1/21.
//
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mobileTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDesign()
    }
    func setUpDesign(){
        mobileTextField.layer.cornerRadius = 10
        mobileTextField.backgroundColor = .white
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.backgroundColor = .white
        loginButton.layer.cornerRadius = 10
    }
    @IBAction func loginOnClick(_ sender: UIButton) {
    }
}

