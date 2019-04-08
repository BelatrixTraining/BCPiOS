//
//  UserManager.swift
//  Restaurante
//
//  Created by Arturo Gamarra on 3/30/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//

import Foundation
import KeychainSwift

class UserManager {
    
    static let shared = UserManager()
    
    var currentUser:User?
    
    init() {
        currentUser = retrieveUser()
    }
    
    enum UserResponse {
        case success(User)
        case failure(Error)
    }
    
    func login(email:String,
               password:String,
               completion:@escaping (UserResponse)-> Void) {
        
        let service = UserRepository()
        service.login(email: email, password: password) { (respuesta) in
            switch respuesta {
            case .failure(let error):
                completion(.failure(error))
                
            case .sucess(let json):
                let token = json["token"].stringValue
                KeychainSwift().set(token, forKey: "USER_TOKEN")
                
                let user = User()
                user.copy(from: json)
                self.save(user: user)
                
                self.currentUser = user
                completion(.success(user))
            }
        }
    }
    
    func logout() {
        self.currentUser = nil
        UserDefaults.standard.removeObject(forKey: "CURRENT_USER")
        KeychainSwift().delete("USER_TOKEN")
    }
    
    private func save(user:User) {
        do {
            let userData = try NSKeyedArchiver.archivedData(withRootObject: user
                , requiringSecureCoding: false)
            UserDefaults.standard.set(userData, forKey: "CURRENT_USER")
            
        } catch(let ex) {
            print(ex)
        }
    }
    
    private func retrieveUser() -> User? {
        do {
            let defaults = UserDefaults.standard
            guard let userData = defaults.data(forKey: "CURRENT_USER"),
                let user = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(userData) as? User else {
                    return nil
            }
            return user
            
        } catch(let ex) {
            print(ex)
            return nil
        }
    }
    
}
