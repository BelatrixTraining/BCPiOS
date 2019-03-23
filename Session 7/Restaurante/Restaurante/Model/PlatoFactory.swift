//
//  PlatoFactory.swift
//  Restaurante
//
//  Created by Arturo Gamarra on 2/23/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//

import Foundation

class PlatoFactory {
    
    class func crearPlatos() -> [Plato] {
        
        let plato1 = ["precio_plato": "10", "nombre_plato": "Ensalada de Palta", "id_categoria": "1", "id_plato": "1", "descripcion_plato": "Ensalada a base de trozos de palta, con rodajes de tomate y cebolla.", "archivo_plato": "ensaladapalta"]
        
        let plato2 = ["precio_plato": "15", "nombre_plato": "Ceviche de Pescado", "id_categoria": "1", "id_plato": "2", "descripcion_plato": "Pescado en trozos, cebolla y limon con mucho aji", "archivo_plato": "ceviche"]
        
        let plato3 = ["precio_plato": "10", "nombre_plato": "Causa de Limeña", "id_categoria": "1", "id_plato": "3", "descripcion_plato": "Base de papa amarilla, limón, ají, lechuga, huevo cocido, palta y aceitunas negras. ", "archivo_plato": "causalimeña"]
        
        let plato4 = ["precio_plato": "10", "nombre_plato": "Papa a la Huancaína", "id_categoria": "1", "id_plato": "4", "descripcion_plato": "Papa sancochada, bañada con salsa de ají molido, leche, aceite, queso fresco, huevo sancochado, aceitunas negras y hojas de lechuga", "archivo_plato": "papahuancaina"]
        
        let plato5 = ["precio_plato": "20", "nombre_plato": "Lomo Saltado de Carne", "id_categoria": "2", "id_plato": "5", "descripcion_plato": "Trozos de carne con papas fritas y arroz", "archivo_plato": "lomo"]
        
        let plato6 = ["precio_plato": "30", "nombre_plato": "Arroz con Pato", "id_categoria": "2", "id_plato": "6", "descripcion_plato": "Arroz, pato, ají, chicha de jora y especias.", "archivo_plato": "arrozconpato"]
        
        let plato7 = ["precio_plato": "15", "nombre_plato": "Cau Cau", "id_categoria": "2", "id_plato": "7", "descripcion_plato": "Mondongo y papas amarillas picadas en forma de cuadrados pequeños, que se cocinan en una base \tde ají amarillo, cebolla, ajo y perejil.", "archivo_plato": "caucau"]
        
        let plato8 = ["precio_plato": "20", "nombre_plato": "Carapulcra", "id_categoria": "2", "id_plato": "8", "descripcion_plato": "Papa seca sancochada y guisada con carnes de chancho y gallina, ají panca y mirasol, ajos y otras especias.", "archivo_plato": "carapulcra"]
        
        let plato9 = ["precio_plato": "20", "nombre_plato": "Ají de Gallina", "id_categoria": "2", "id_plato": "9", "descripcion_plato": "Ají o crema espesa compuesta por gallina.", "archivo_plato": "ajidegallina"]
        
        let plato11 = ["precio_plato": "12", "nombre_plato": "Aguadito", "id_categoria": "3", "id_plato": "10", "descripcion_plato": "Tradicional caldo de pollo con culantro, choclo, arroz y vegetales", "archivo_plato": "aguadito"]
        
        let plato12 = ["precio_plato": "14", "nombre_plato": "Menestron", "id_categoria": "3", "id_plato": "11", "descripcion_plato": "Fideos gruesos, carne, zanahoria, cebolla, albahaca y queso rallado, choclo, papa blanca, habas, entre otros.\n", "archivo_plato": "menestron"]
        
        let plato14 = ["precio_plato": "12", "nombre_plato": "Sopa de Verduras", "id_categoria": "3", "id_plato": "12", "descripcion_plato": "Elaborada básicamente por verduras, la cantidad de propiedades beneficiosas para nuestra salud son innumerables.", "archivo_plato": "sopaverduras"]
        
        let plato15 = ["precio_plato": "12", "nombre_plato": "Caldo de Gallina", "id_categoria": "3", "id_plato": "13", "descripcion_plato": "Preparada con fideos, papas y presas de gallina.", "archivo_plato": "caldogallina"]
        
        let todosLosPlatos = [plato1, plato2, plato3, plato4, plato5, plato6, plato7, plato8, plato9, plato11, plato12,  plato14,  plato15]
        var platos:[Plato] = []
        
        for json in todosLosPlatos {
            let plato = Plato(json: json)
            platos.append(plato)
        }
        return platos
    }
    
}
