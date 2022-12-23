//
//  ProfileManager.swift
//  BMIDiseaseTracker
//
//  Created by Huang Yan on 12/23/22.
//

import Foundation



final class ProfileManager: ObservableObject {
    
    private let baseUrl = "https://BMIDiseaseTracker/user/"
    
    @Published var profile: Profile? 
    lazy var balance: LongCurrency = {
        return LongCurrency(balance: profile?.balance ?? 0)
    }()
    
    static let shared = ProfileManager() //singleton
    
    struct Profile: Codable {
        
        let userId: Int
        let email: String
        let username: String
        var balance: Int
        
    }
    //MARK: - Networking
    func fetchProfile(forUserID id: Int, completion: @escaping(Result<Profile,Error>) -> Void) {
        guard let url = URL(string: "\(baseUrl)\(id)/") else {
            //completion(.failure())
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                //completion(.failure())
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let result = try decoder.decode(Profile.self, from: data)
                completion(.success(result))
            } catch {
                //completion(.failure())
            }
        }
        task.resume()
    }
    
    func updateProfile() { // update balance to backend when it is changed
        guard let profile = ProfileManager.shared.profile, let url = URL(string: "\(baseUrl)\(profile.userId)") else {
            fatalError("updating while profile is nil or Url address is wrong")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        let data: [String: String]  = [
            "balance": "\(profile.balance)"
        ]
        let encodedData = try! JSONSerialization.data(withJSONObject: data)
        URLSession.shared.uploadTask(with: request, from: encodedData) { (responseData, response, error) in
            guard let response = response as? HTTPURLResponse, error == nil else {
                // handle error
                print(error?.localizedDescription)
                return
            }
            guard response.statusCode == 200 else {
                // handle error
                print(error?.localizedDescription)
                return
            }
            if let responseData = responseData {
                print(responseData)
            }
        }.resume()
    }
}
