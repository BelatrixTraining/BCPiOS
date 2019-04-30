//
//  SyncManager.swift
//  Restaurante
//
//  Created by Arturo Gamarra on 3/23/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//

import Foundation

class SyncManager {
    
    // MARK: - Singleton
    static let shared = SyncManager()
    
    func syncInformacion(success: @escaping (Any) -> Void,
                         failure: @escaping (Error) -> Void) {
        
        CategoriaManager.shared.getCategorias { (response) in
            switch response {
            case .sucess(let categorias):
                
                // INICIO DE USO DE GCD (Grand Central Dispatch)
                let group = DispatchGroup()
                
                var a = 0
                for cat in categorias {
                    let id = cat.id!
                    let service = PlatoRepository()
                    
                    let indice = a
                    group.enter()
                    service.getPlatos(porCategoria: id
                        , completionHandler: { (result) in

                            print("Respuesta del servicio \(indice)")
                            switch result {
                            case .sucess(let platJSONs):
                                // SAVE IN DB
                                print(platJSONs)
                                group.leave()
                                
                            case .failure(let error):
                                print(error)
                                group.leave()
                            }
                            
                    })
                    
                    a += 1
                }
                
                group.notify(queue: DispatchQueue.main, execute: {
                    print("Termino de sincronizar")
                    success(categorias)
                })
                
                
                
            case .failure(let error):
                failure(error)
            }
        }
        
    }
    
}
