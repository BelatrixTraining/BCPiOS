//
//  PlatoDetalleViewController.swift
//  Restaurante
//
//  Created by Arturo Gamarra on 2/23/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//

import UIKit

class PlatoDetalleViewController: UIViewController {

    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Cargando plato detalle")
    }
    
    // 4to esta por aparecer
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("PLato detalle esta por aparecer")
    }
    
    // 5to aparecio el view controller
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //        self.showAlert(title: "Info", message: "Claro pe mascota")
        print("PLato detalle ya es visible")
    }
    
    // MARK: - Death cycle
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("PLato detalle esta por desaparecer")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("PLato detalle desaparecio")
    }
    
    deinit {
        print("Desde el destructor")
    }

}
