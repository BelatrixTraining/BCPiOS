//
//  User.swift
//  Restaurante
//
//  Created by Arturo Gamarra on 3/30/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//

import Foundation
import SwiftyJSON

class User: NSObject, NSCoding {

    var nombre:String = ""
    var apellidoPaterno:String = ""
    var apellidoMaterno:String = ""
    var nombreImagen:String = ""
    var email: String = ""
    
    override init() {
        super.init()
    }
    
    func copy(from json:JSON) {
        nombre = json["nombres"].stringValue
        apellidoPaterno = json["apellido_paterno"].stringValue
        apellidoMaterno = json["apellido_materno"].stringValue
        nombreImagen = json["imagen"].stringValue
        email = json["email"].stringValue
    }
   
    // MARK: - NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(nombre, forKey: "nombre")
        aCoder.encode(apellidoPaterno, forKey: "apellidoPaterno")
        aCoder.encode(apellidoMaterno, forKey: "apellidoMaterno")
        aCoder.encode(email, forKey: "email")
        aCoder.encode(nombreImagen, forKey: "nombreImagen")
    }
    
    required init?(coder aDecoder: NSCoder) {
        nombre = aDecoder.decodeObject(forKey: "nombre") as? String ?? ""
        apellidoPaterno = aDecoder.decodeObject(forKey: "apellidoPaterno") as? String ?? ""
        apellidoMaterno = aDecoder.decodeObject(forKey: "apellidoMaterno") as? String ?? ""
        email = aDecoder.decodeObject(forKey: "email") as? String ?? ""
        nombreImagen = aDecoder.decodeObject(forKey: "nombreImagen") as? String ?? ""
    }
}
