//
//  GFButton.swift
//  GHFollowers
//
//  Created by Mark Trance on 2/27/22.
//

import UIKit

class GFButton: UIButton {

	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
	}
	
	// Storyboard initialization case
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	init(backgroundColor: UIColor, title: String) {
		super.init(frame: .zero)
		self.backgroundColor = backgroundColor
		self.setTitle(title, for: .normal)
		configure()
	}
	
	private func configure() {
		layer.cornerRadius = 10
		titleLabel?.textColor = .white
		titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
		translatesAutoresizingMaskIntoConstraints = false
	}
}
