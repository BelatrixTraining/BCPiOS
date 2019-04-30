//
//  UserRepository.swift
//  Restaurante
//
//  Created by Arturo Gamarra on 3/30/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//

import Foundation
import SwiftyJSON

class UserRepository: RestAPI {
    
    enum UserResponse {
        case sucess(JSON)
        case failure(Error)
    }
    
    func login(email:String,
               password:String,
               completionHandler: @escaping (UserResponse) -> Void) {
        
        let url = "\(Constans.urlBase)auth/clientes-login"
        let params = ["email": email,
                      "password":password]
        alamoService(atUrl: url, verb: .post, body: params, success: { (json) in
            
            if let mensaje = json["message"].string {
                let error = NSError(domain: ""
                    , code: -9000
                    , userInfo: [NSLocalizedDescriptionKey:mensaje])
                let response = UserResponse.failure(error)
                completionHandler(response)
                return
            }
            
            let response = UserResponse.sucess(json["data"])
            completionHandler(response)
            
        }) { (error) in
            completionHandler(.failure(error))
        }
    }
    
}
