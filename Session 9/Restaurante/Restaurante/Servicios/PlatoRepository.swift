//
//  PlatoRepository.swift
//  Restaurante
//
//  Created by Arturo Gamarra on 3/9/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//

import Foundation
import SwiftyJSON

class PlatoRepository:RestAPI {
    
    enum PlatosResponse {
        case sucess([JSON])
        case failure(Error)
    }
    
    func getPlatos(completionHandler: @escaping (PlatosResponse) -> Void) {
        let url = "\(Constans.urlBase)platos"
        alamoService(atUrl: url, verb: .get, success: { (json) in
            
            if let mensaje = json["message"].string {
                let error = NSError(domain: ""
                    , code: -9000
                    , userInfo: [NSLocalizedDescriptionKey:mensaje])
                let response = PlatosResponse.failure(error)
                completionHandler(response)
                return
            }
            
            let platosJSONs = json["data"].arrayValue
            let response = PlatosResponse.sucess(platosJSONs)
            completionHandler(response)
            
        }) { (error) in
            completionHandler(.failure(error))
        }
    }
    
    func getPlatos(porCategoria categoriaId:String,
                   completionHandler: @escaping (PlatosResponse) -> Void) {
        
        let url = "\(Constans.urlBase)platos/categoria/\(categoriaId)"
        alamoService(atUrl: url, verb: .get, success: { (json) in
            
            if let mensaje = json["message"].string {
                let error = NSError(domain: ""
                    , code: -9000
                    , userInfo: [NSLocalizedDescriptionKey:mensaje])
                let response = PlatosResponse.failure(error)
                completionHandler(response)
                return
            }
            
            let platosJSONs = json["data"].arrayValue
            let response = PlatosResponse.sucess(platosJSONs)
            completionHandler(response)
            
        }) { (error) in
            completionHandler(.failure(error))
        }
    }
    
}
