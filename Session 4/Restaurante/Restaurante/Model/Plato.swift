//
//  Plato.swift
//  Restaurante
//
//  Created by Arturo Gamarra on 2/23/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//

import UIKit

class Plato:NSObject {
    
    // MARK: - Properties
    var price:Double = 0
    var name:String = ""
    var id:String = ""
    var detail:String = ""
    var imageName:String = ""
    
    // MARK: - Calculated Properties
    var image:UIImage? {
        return UIImage(named: imageName)
    }
    
    override var description: String { // TO STRING
        return name
    }
    
    override init() {
        super.init()
    }
    
    init(json:[String:String]) {
        super.init()
        id = json["id_plato"] ?? ""
        name = json["nombre_plato"] ?? ""
        detail = json["descripcion_plato"] ?? ""
        imageName = json["archivo_plato"] ?? ""
        
        let priceStr = json["precio_plato"] ?? ""
        price = Double(priceStr) ?? 0
    }

}
