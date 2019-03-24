//
//  Plato+CoreDataProperties.swift
//  Restaurante
//
//  Created by Arturo Gamarra on 3/23/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//
//

import Foundation
import CoreData


extension Plato {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Plato> {
        return NSFetchRequest<Plato>(entityName: "Plato")
    }

    @NSManaged public var id: String?
    @NSManaged public var detalle: String?
    @NSManaged public var nombre: String?
    @NSManaged public var nombreImagen: String?
    @NSManaged public var precio: Double
    @NSManaged public var favorito: Bool
    @NSManaged public var categoria: Categoria?

}
