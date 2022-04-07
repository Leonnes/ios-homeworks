//
//  ProfileViewController.swift
//  Netology_IB_Instruments
//
//  Created by Сергей Прокопьев on 05.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .red
        let screenWidth = UIScreen.main.bounds.width
        if let myView = Bundle.main.loadNibNamed("ProfileView", owner: nil, options: nil)?.first as? ProfileView {
            myView.frame = CGRect(x: 10, y: 50, width: screenWidth - 32, height: 500)
            view.addSubview(myView)
        }
    }
}
