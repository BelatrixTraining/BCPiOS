//
//  Categoria+CoreDataProperties.swift
//  Restaurante
//
//  Created by Arturo Gamarra on 3/30/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//
//

import Foundation
import CoreData


extension Categoria {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Categoria> {
        return NSFetchRequest<Categoria>(entityName: "Categoria")
    }

    @NSManaged public var detalle: String?
    @NSManaged public var id: String?
    @NSManaged public var nombre: String?
    @NSManaged public var platos: NSSet?

}

// MARK: Generated accessors for platos
extension Categoria {

    @objc(addPlatosObject:)
    @NSManaged public func addToPlatos(_ value: Plato)

    @objc(removePlatosObject:)
    @NSManaged public func removeFromPlatos(_ value: Plato)

    @objc(addPlatos:)
    @NSManaged public func addToPlatos(_ values: NSSet)

    @objc(removePlatos:)
    @NSManaged public func removeFromPlatos(_ values: NSSet)

}
