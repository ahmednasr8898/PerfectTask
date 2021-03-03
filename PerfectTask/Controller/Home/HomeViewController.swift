//
//  HomeViewController.swift
//  PerfectTask
//
//  Created by Ahmed Nasr on 3/1/21.
//
import UIKit
import Alamofire
import SideMenu

class HomeViewController: UIViewController {

    @IBOutlet weak var childTableView: UITableView!
    var arrOfChild = [ChildModel]()
    var menu: SideMenuNavigationController?
    @IBOutlet weak var trailingTableViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var leadingTableViewConstaring: NSLayoutConstraint!
    @IBOutlet weak var topTableViewConstarint: NSLayoutConstraint!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigation()
        setUpTableView()
        getChild()
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
        navigationController?.navigationBar.isHidden = false
    }
    func setUpConstraint(){
        let viewHeight = self.view.frame.height
        let viewWidth = self.view.frame.width
        topTableViewConstarint.constant = viewHeight * 0.020
        leadingTableViewConstaring.constant = viewWidth * 0.060
        trailingTableViewConstraint.constant = viewWidth * 0.060
    }
    func setUpTableView(){
        childTableView.register(UINib(nibName: "ChildTableViewCell", bundle: nil), forCellReuseIdentifier: "ChildTableViewCell")
        childTableView.delegate = self
        childTableView.dataSource = self
        childTableView.rowHeight = 100
        childTableView.tableFooterView = UIView()
        childTableView.separatorStyle = .none
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
    func getChild(){
        let url = "http://165.22.83.141/api/user/childByParent"
        guard let userID = UserDefaults.standard.object(forKey: "UserID") else{return}
        let parameter = ["userID": userID]
     
        AF.request(url, method: .get, parameters: parameter, encoding: URLEncoding.default).responseJSON { (response) in
            switch response.result{
            case .failure(let error):
                print("error when connect with server for get child: \(error.localizedDescription)")
            case .success(_):
                guard let data = response.data else {return}
                do {
                    let json = try JSONDecoder().decode([ChildModel].self, from: data)
                    self.arrOfChild = json
                    self.childTableView.reloadData()
                    print("get child done")
                } catch{
                    print("error when catch chil data:", error.localizedDescription)
                }
            }
        }
    }
}
extension HomeViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOfChild.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChildTableViewCell", for: indexPath) as! ChildTableViewCell
        let user = arrOfChild[indexPath.row]
        cell.nameLabel.text = "\(user.firstname ?? "") \(arrOfChild[indexPath.row].surname ?? "")"
        cell.rateLabel.text = "\(user.rate ?? 0)/10"
        cell.getUserImage = arrOfChild[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectUser = arrOfChild[indexPath.row]
        guard let userFName = selectUser.firstname, let userLName = selectUser.surname  else {return}
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        vc.userName = "\(String(describing: userFName)) \(userLName)"
        vc.imagePath = selectUser.imgPath ?? ""
        navigationController?.pushViewController(vc, animated: true)
    }
}
