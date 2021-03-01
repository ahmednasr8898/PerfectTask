//
//  MenuViewController.swift
//  SocialApp
//
//  Created by Ahmed Nasr on 12/8/20.
//
import UIKit
class MenuViewController: UITableViewController {
        
    let items = ["الرئسية", "اعدادات", "خروج"]
    let itemImage = [UIImage(systemName: "house"), UIImage(systemName: "gearshape"), UIImage(systemName: "escape")]
  
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "menuCell")
        tableView.tableFooterView = UIView()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! MenuTableViewCell
        cell.imageMenu.image = itemImage[indexPath.row]
        cell.labelMenu.text = items[indexPath.row]
        if indexPath.row == 2{
            cell.labelMenu.textColor = .red
            cell.imageMenu.tintColor = .red
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemIndex = indexPath.row
        if itemIndex == 0 {
            print("go to profile page")
        }else if itemIndex == 1{
            print("go to settings page")
        }else if itemIndex == 2{
            
        }
    }
}
   
