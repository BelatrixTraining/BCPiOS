//
//  PlatoRepository.swift
//  Restaurante
//
//  Created by Arturo Gamarra on 3/9/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//

import Foundation

class PlatoRepository:RestAPI {
    
    enum PlatosResponse {
        case sucess([[String:Any]])
        case failure(Error)
    }
    
    func getPlatos(completionHandler: @escaping (PlatosResponse) -> Void) {
        let url = "\(Constans.urlBase)platos"
        alamoService(atUrl: url, verb: .get, success: { (json) in
            
            guard let dict = json as? [String:Any]  else {
                let error = NSError(domain: ""
                    , code: -9000
                    , userInfo: [NSLocalizedDescriptionKey:"Invalid"])
                completionHandler(.failure(error))
                return
            }
            
            if let mensaje = dict["message"] as? String {
                let error = NSError(domain: ""
                    , code: -9000
                    , userInfo: [NSLocalizedDescriptionKey:mensaje])
                let response = PlatosResponse.failure(error)
                completionHandler(response)
                return
            }
            
            let platosJSONs = dict["data"] as! [[String:Any]]
            let response = PlatosResponse.sucess(platosJSONs)
            completionHandler(response)
            
        }) { (error) in
            completionHandler(.failure(error))
        }
    }
    
}
