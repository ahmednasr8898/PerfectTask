//
//  UIViewController+Extension.swift
//  PerfectTask
//
//  Created by Ahmed Nasr on 3/2/21.
//
import Foundation
import UIKit
extension UIViewController{
    func goToByPresent<vc: UIViewController>(storyboardName: String , viewControllerName: vc.Type , showAs: UIModalPresentationStyle){
        let identfire = String(describing: viewControllerName)
        if let page = UIStoryboard(name: storyboardName, bundle:nil).instantiateViewController(withIdentifier: identfire) as? vc{
        page.modalPresentationStyle = showAs
        present(page, animated: true, completion: nil)
        }
    }
    func goToByNavigate<vc: UIViewController>(storyboardName: String , viewControllerName: vc.Type) {
        let identfire = String(describing: viewControllerName)
        if let page = UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: identfire) as? vc{
        navigationController?.pushViewController(page, animated: true)
        }
    }
}
