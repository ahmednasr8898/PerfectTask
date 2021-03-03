//
//  ViewController.swift
//  PerfectTask
//
//  Created by Ahmed Nasr on 3/1/21.
//
import UIKit
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet weak var mobileTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var topLogoConstraint: NSLayoutConstraint!
    @IBOutlet weak var topStackConstraint: NSLayoutConstraint!
    @IBOutlet weak var topLoginButtonConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDesign()
    }
    override func viewDidLayoutSubviews() {
        setUpConstraint()
    }
    func setUpDesign(){
        mobileTextField.layer.cornerRadius = 10
        mobileTextField.backgroundColor = .white
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.backgroundColor = .white
        loginButton.layer.cornerRadius = 10
        navigationController?.navigationBar.isHidden = true
    }
    func setUpConstraint(){
        let viewHeight = self.view.frame.height
        topLogoConstraint.constant = viewHeight * 0.100
        topStackConstraint.constant = viewHeight * 0.067
        topLoginButtonConstraint.constant = viewHeight * 0.084
    }
    @IBAction func loginOnClick(_ sender: UIButton) {
        guard let mobile = mobileTextField.text, !mobile.isEmpty, let password = passwordTextField.text, !password.isEmpty else {return}
        login(mobile: mobile, password: password)
    }
    func login(mobile: String, password: String){
        let url = "http://165.22.83.141/api/user/login"
        let parameters = ["val": mobile, "password": password]
        AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default).responseJSON { (response) in
            switch response.result{
            case .failure(let error):
                print("error when connect with server for login: \(error.localizedDescription)")
            case .success(_):
                guard let data = response.data else {return}
                do{
                    let jsonSuccess = try JSONDecoder().decode(LoginSuccessModel.self, from: data)
                    let jsonFailed = try JSONDecoder().decode(LoginFailedModel.self, from: data)
                    
                    if let userID = jsonSuccess._id {
                        print("Login Success")
                        UserDefaults.standard.setValue(userID, forKey: "UserID")
                        self.goToByNavigate(storyboardName: "Main", viewControllerName: HomeViewController.self)
                    }else{
                        print(jsonFailed.message ?? "")
                    }
                }catch{
                    print("error when catch data from server: \(error.localizedDescription)")
                }
            }
        }
    }
}

