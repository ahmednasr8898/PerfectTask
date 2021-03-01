//
//  HomeViewController.swift
//  PerfectTask
//
//  Created by Ahmed Nasr on 3/1/21.
//
import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var childTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        setUpTableView()
    }
    func setUpTableView(){
        childTableView.register(UINib(nibName: "ChildTableViewCell", bundle: nil), forCellReuseIdentifier: "ChildTableViewCell")
        childTableView.delegate = self
        childTableView.dataSource = self
        childTableView.rowHeight = 100
        childTableView.tableFooterView = UIView()
        childTableView.separatorStyle = .none
    }
}
extension HomeViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChildTableViewCell", for: indexPath) as! ChildTableViewCell
        return cell
    }
}
