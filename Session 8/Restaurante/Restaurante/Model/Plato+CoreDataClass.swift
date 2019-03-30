//
//  Plato+CoreDataClass.swift
//  Restaurante
//
//  Created by Arturo Gamarra on 3/23/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//
//

import Foundation
import CoreData
import SwiftyJSON

@objc(Plato)
public class Plato: NSManagedObject {
    
    func copy(from json:JSON) {
        id = json["_id"].stringValue
        nombre = json["nombre"].stringValue
        detalle = json["descripcion"].stringValue
        nombreImagen = json["imagen"].stringValue
        precio = json["precio"].doubleValue
        
        let context = self.managedObjectContext!
        let categoriaId = json["categoria_id"]["id"].stringValue
        let categoria = Categoria.obtenerOCrear(porId: categoriaId,
                                                inContext: context)
        self.categoria = categoria
    }

    class func obtener(porCategoria categoria:Categoria,
                       inContext context:NSManagedObjectContext) -> [Plato] {
        
        guard let id = categoria.id else {
            return []
        }
        
        let request = NSFetchRequest<Plato>(entityName: "Plato")
        
        let predicado = NSPredicate(format: "categoria.id == %@", id)
        request.predicate = predicado
        
        let sort = NSSortDescriptor(key: "nombre", ascending: true)
        request.sortDescriptors = [sort]
        
        let respuesta = try? context.fetch(request)
        return respuesta ?? []
    }
    
}
