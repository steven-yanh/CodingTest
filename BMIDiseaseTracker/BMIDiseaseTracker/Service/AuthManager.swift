//
//  AuthManager.swift
//  BMIDiseaseTracker
//
//  Created by Alexander Zhurov on 10.04.22.
//

import SwiftUI

final class AuthManager: ObservableObject {
    enum State: Equatable {
        case needAuth
        case failed
        case loggedIn
        case userLoaded
    }
    
//    var user: UsersModel.User?
    
    // MARK: - Properties
    @Published var state: State = .needAuth
    
    static let shared = AuthManager()
    
    private static let possibleDelaySec = 10
    
    var needToRefreshToken: Bool {
        get {
            let tokenTtl = UserDefaults.standard.integer(forKey: "tokenTtl")
            let currentTimestamp = Int(NSDate().timeIntervalSince1970);

            return tokenTtl - type(of: self).possibleDelaySec < currentTimestamp
        }
    }

    // MARK: - Initialization

    private init() {
        self.state = AuthManager.isLoggedIn() ? .loggedIn : .needAuth
    }

    // MARK: - Methods
    
    func logout() -> Void {
        UserDefaults.standard.set("", forKey: "token");
        UserDefaults.standard.set("", forKey: "refreshToken");
        UserDefaults.standard.set(0, forKey: "tokenTtl");
        UserDefaults.standard.set(0, forKey: "refreshTokenTtl");
        
        state = .needAuth
    }
    
    func updateTokens(_ data: [String: Any?]) -> Void {
        let currentTimestamp = Int(NSDate().timeIntervalSince1970);
        let token = data["token"] ?? ""
        let refreshToken = data["refreshToken"] ?? ""
        let tokenTtl = currentTimestamp + (data["tokenTtl"] as! Int)
        let refreshTokenTtl = currentTimestamp + (data["refreshTokenTtl"] as! Int)

        UserDefaults.standard.set(token, forKey: "token");
        UserDefaults.standard.set(refreshToken, forKey: "refreshToken");
        UserDefaults.standard.set(tokenTtl, forKey: "tokenTtl");
        UserDefaults.standard.set(refreshTokenTtl, forKey: "refreshTokenTtl");
    }
    
    func login(login: String, password: String) -> Void {
        guard let url = URL(string: "http://ios.sl-vs.com/api/ios/login") else {
            fatalError("Missing URL")
        }
                
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: ["login": login, "password": password])
        
        self.state = .userLoaded
//        NetworkManager.shared.request(urlRequest: urlRequest).done { response in
//            self.updateTokens(response.vars)
//            self.loadUser()
//        }.catch { error in
//            let error = error as? NetworkManager.NetworkError
//            self.state = .failed
//            AlertManager.shared.error(error?.getMessage() ?? "Неизвестная ошибка")
//        }
    }
    
    func loadUser() -> Void {
        guard let url = URL(string: "http://ios.sl-vs.com/api/ios/user/get") else {
            fatalError("Missing URL")
        }
                
//        NetworkManager.shared.request(urlRequest: URLRequest(url: url)).done { response in
//            self.user = try UsersModel.User(from: response.vars)
//            self.state = .userLoaded
//        }.catch { error in
//            let error = error as? NetworkManager.NetworkError
//            self.state = .failed
//            AlertManager.shared.error(error?.getMessage() ?? "Неизвестная ошибка")
//        }
    }
    
    private class func isLoggedIn() -> Bool {
        let refreshTokenTtl = UserDefaults.standard.integer(forKey: "refreshTokenTtl")
        let currentTimestamp = Int(NSDate().timeIntervalSince1970);

        return refreshTokenTtl - self.possibleDelaySec > currentTimestamp
    }
}

