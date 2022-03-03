//
//  FollowerListVC.swift
//  GHFollowers
//
//  Created by Mark Trance on 3/3/22.
//

import UIKit

class FollowerListVC: UIViewController {
	
	var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
		
		view.backgroundColor = .systemBackground
		navigationController?.isNavigationBarHidden = false
		navigationController?.navigationBar.prefersLargeTitles = true
    }
    


}
