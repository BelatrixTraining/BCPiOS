//
//  CategoriaRepository.swift
//  Restaurante
//
//  Created by Arturo Gamarra on 3/23/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//

import Alamofire
import SwiftyJSON

class CategoriaRepository:RestAPI {
    
    enum CatogoriasResponse {
        case sucess([JSON])
        case failure(Error)
    }
    
    func getCategorias(completionHandler: @escaping(CatogoriasResponse) -> Void) {
        let url = "\(Constans.urlBase)categorias"
        alamoService(atUrl: url, verb: .get, success: { (json) in
            
            if let mensaje = json["message"].string {
                let error = NSError(domain: ""
                    , code: -9000
                    , userInfo: [NSLocalizedDescriptionKey:mensaje])
                let response = CatogoriasResponse.failure(error)
                completionHandler(response)
                return
            }
            
            let json = json["data"].arrayValue
            let response = CatogoriasResponse.sucess(json)
            completionHandler(response)
            
        }) { (error) in
            completionHandler(.failure(error))
        }
    }

}

