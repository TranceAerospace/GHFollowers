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
		navigationController?.navigationBar.prefersLargeTitles = true
		
		
		NetworkManager.shared.getFollowers(for: username, page: 1) { followers, errorMessage in
			guard let followers = followers else {
				self.presentGFAlertOnMainThread(title: "Bad stuff happened", message: errorMessage!, buttonTitle: "OK")
				return
			}
			
			print("followers.count = \(followers.count)")
			print(followers)

		}
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.setNavigationBarHidden(false, animated: true)
	}
    


}
