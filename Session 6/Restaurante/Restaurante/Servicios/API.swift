//
//  API.swift
//  Restaurante
//
//  Created by Arturo Gamarra on 3/9/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//

import Foundation

class API {
    
    func callService(atUrl urlString:String,
                     verb:String,
                     headers:[String:String]? = nil,
                     body:[String:Any]? = nil) {

        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.httpMethod = verb
        if let parametros = body {
            let data = JSONSerialization.data(withJSONObject: parametros, options: .prettyPrinted)
        }
        
        let configuracion = URLSessionConfiguration.default
        configuracion.allowsCellularAccess = true
        configuracion.timeoutIntervalForRequest = 60
        configuracion.httpAdditionalHeaders = headers
        
        let session = URLSession(configuration: configuracion)
        let task = session.dataTask(with: <#T##URLRequest#>, completionHandler: <#T##(Data?, URLResponse?, Error?) -> Void#>)
        task.resume() // Llama al servicio
        
        // Descargar cosas pesadas (imagen, video, archivo)
//        let task2 = session.downloadTask(with: <#T##URL#>)
        
        // Subir cosas pesadas (imagen, video, archivo)
//        let task3 = session.uploadTask
        
        
    }
    
}
