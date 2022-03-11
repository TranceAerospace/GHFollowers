//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Mark Trance on 3/11/22.
//

import Foundation

class NetworkManager {
	static let shared = NetworkManager()
	let baseURL = "https://api.github.com/users/"
	
	private init() {}
	
	func getFollowers(for username: String, page: Int, comleted: @escaping([Follower]?, String?) -> Void) {
		let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
		
		guard let url = URL(string: endpoint) else {
			comleted(nil, "This username created an invalid request, please try again")
			return
		}
		
		let task = URLSession.shared.dataTask(with: url) { data, response, error in
			if let _ = error {
				comleted(nil, "Unable to complete request, Please check your internet")
				return
			}
			
			guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
				comleted(nil, "Invalid response from the server, Please try again.")
				return
			}
			
			guard let data = data else {
				comleted(nil, "The data received from teh server was invalid.")
				return
			}
			
			do {
				let decoder = JSONDecoder()
				decoder.keyDecodingStrategy = .convertFromSnakeCase
				let followers = try decoder.decode([Follower].self, from: data)
				comleted(followers, nil)
			} catch {
				comleted(nil, "The data received from the server was invalid.")
				
			}
		}
		
		task.resume()
		
	}
}
