//
//  HomeViewController.swift
//  PerfectTask
//
//  Created by Ahmed Nasr on 3/1/21.
//
import UIKit
import Alamofire

class HomeViewController: UIViewController {

    @IBOutlet weak var childTableView: UITableView!
    var arrOfChild = [ChildModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        setUpTableView()
        getChild()
    }
    func setUpTableView(){
        childTableView.register(UINib(nibName: "ChildTableViewCell", bundle: nil), forCellReuseIdentifier: "ChildTableViewCell")
        childTableView.delegate = self
        childTableView.dataSource = self
        childTableView.rowHeight = 100
        childTableView.tableFooterView = UIView()
        childTableView.separatorStyle = .none
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
}
