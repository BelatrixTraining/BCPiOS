//
//  CategoriaManager.swift
//  Restaurante
//
//  Created by Arturo Gamarra on 3/30/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//

import Foundation

class CategoriaManager {
    
    static let shared = CategoriaManager()
    
    enum CategoriasResponse {
        case sucess([Categoria])
        case failure(Error)
    }
    
    func getCategorias(completion:@escaping (CategoriasResponse) -> Void) {
        
        let servicio = CategoriaRepository()
        servicio.getCategorias { (respuesta) in
            switch respuesta {
            case .sucess(let jsons):
                
                // Obtenemos el contexto
                let container = CoreDataManager.shared.persistentContainer
                let context = container.viewContext
                
                for json in jsons {
                    // Buscamos o creamos
                    let id = json["_id"].stringValue
                    let categoria = Categoria.obtenerOCrear(porId: id,
                                                            inContext: context)
                    categoria.copy(from: json)
                }
                // Guardamos
                try? context.save()
                
                let categorias = Categoria.obtenerTodos(inContext: context)
                completion(.sucess(categorias))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
