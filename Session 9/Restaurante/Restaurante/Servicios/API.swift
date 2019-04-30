//
//  API.swift
//  Restaurante
//
//  Created by Arturo Gamarra on 3/9/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//

import Alamofire
import SwiftyJSON

protocol RestAPI {
    
    typealias successResponse = (JSON) -> Void
    
    func alamoService(atUrl urlString:String,
                      verb:HTTPMethod,
                      headers:[String:String]?,
                      body:[String:Any]?,
                      success: @escaping successResponse,
                      failure: @escaping (Error) -> Void)
}

extension RestAPI {
    
    func alamoService(atUrl urlString:String,
                      verb:HTTPMethod,
                      headers:[String:String]? = nil,
                      body:[String:Any]? = nil,
                      success: @escaping successResponse,
                      failure: @escaping (Error) -> Void) {
        
        let alamoRequest = Alamofire.request(urlString,
                                             method: verb,
                                             parameters: body,
                                             encoding: URLEncoding.default,
                                             headers: headers)
        alamoRequest.validate().responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                success(json)
                
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    func callService(atUrl urlString:String,
                     verb:String,
                     headers:[String:String]? = nil,
                     body:[String:Any]? = nil) {

        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.httpMethod = verb
        if let parametros = body {
            let data2 = try? JSONSerialization.data(withJSONObject: parametros, options: .prettyPrinted)
            request.httpBody = data2
        }
        
        let configuracion = URLSessionConfiguration.default
        configuracion.allowsCellularAccess = true
        configuracion.timeoutIntervalForRequest = 60
        configuracion.httpAdditionalHeaders = headers
        
        let session = URLSession(configuration: configuracion)
        let task = session.dataTask(with: request) {
            (data, response, error) in
            
            OperationQueue.main.addOperation {
                // Validar error (conexion)
                if let anError = error {
                    print("No se conecto con el server, error: \(anError)")
                    return
                }
                
                // Validar Respuesta
                guard let reponseData = data,
                    let httpResponse = response as? HTTPURLResponse,
                    httpResponse.statusCode >= 200,
                    httpResponse.statusCode <= 299
                    else {
                        print("Respuesta invalida del servidor")
                        return
                }
                do {
                    let jsonR = try JSONSerialization.jsonObject(with: reponseData, options: .allowFragments)
                    print(jsonR)
                    
                } catch(let ex) {
                    print(ex)
                }
            }
        }
        task.resume() // Llama al servicio
        
        // Descargar cosas pesadas (imagen, video, archivo)
        // let task2 = session.downloadTask(with: )
        
        // Subir cosas pesadas (imagen, video, archivo)
        // let task3 = session.uploadTask
        
        
    }
    
}
