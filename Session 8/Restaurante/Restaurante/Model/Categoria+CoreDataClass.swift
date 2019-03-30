//
//  Categoria+CoreDataClass.swift
//  Restaurante
//
//  Created by Arturo Gamarra on 3/23/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//
//

import Foundation
import CoreData
import SwiftyJSON

@objc(Categoria)
public class Categoria: NSManagedObject {
    
    func copy(from json:JSON) {
        id = json["_id"].stringValue
        nombre = json["nombre"].stringValue
        detalle = json["descripcion"].stringValue
    }
    
    class func obtenerTodos(inContext context:NSManagedObjectContext) -> [Categoria] {

        // SELECT * FROM Categoria
        let request = NSFetchRequest<Categoria>(entityName: "Categoria")

        // ORDER BY nombre ASC
        let nombreSort = NSSortDescriptor(key: "nombre", ascending: true)
        request.sortDescriptors = [nombreSort]
        
        let respuesta = try? context.fetch(request)
        return respuesta ?? []
    }

    class func obtenerOCrear(porId categoriaId:String,
                             inContext context:NSManagedObjectContext)
        -> Categoria {
        
        // SELECT * FROM Categoria
        let request = NSFetchRequest<Categoria>(entityName: "Categoria")
        
        // WHERE id = categoriaId
        let predicado = NSPredicate(format: "id == %@", categoriaId)
        request.predicate = predicado
        
        // SWIFT ONLY
        //let predicado2 = NSPredicate { (categoria, _) -> Bool in
        //    return (categoria as? Categoria)?.id == categoriaId
        //}
        
        // ORDER BY nombre ASC
        let nombreSort = NSSortDescriptor(key: "nombre", ascending: true)
        request.sortDescriptors = [nombreSort]
        
        do {
            let respuesta = try context.fetch(request)
            if let categoria = respuesta.first {
                return categoria // Update
            } else {
                return Categoria(context: context) // INSERT
            }
            
        } catch(let exception) {
            print(exception)
            return Categoria(context: context)
        }
    }
    
}




