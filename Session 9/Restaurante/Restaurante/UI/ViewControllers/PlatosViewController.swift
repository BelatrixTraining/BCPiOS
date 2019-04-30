//
//  PlatosViewController.swift
//  Restaurante
//
//  Created by Arturo Gamarra on 2/9/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//

import UIKit

class PlatosViewController: UIViewController {

    static let cellId = "PlatoSimpleCell"
    
    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    var platos:[Plato] = []
    
    // MARK: - Lifecycle
    
    // 2do despertando desde un Interface builder
    override func awakeFromNib() {
        super.awakeFromNib()
        // tableView = nil
    }
    
    // 3ro (2do si es que no se usa storyboard)
    override func viewDidLoad() {
        super.viewDidLoad()
        // tableView ya no es nil !!!
        // Todos los datos estan cargados
        // Se ejecuta 1 sola vez
        
        tableView.backgroundColor = .darkGray
        
        //unowned let weakSelf = self
        // OBJC __weak *weakSelf:PlatosViewController = self
        
        // [unowned self] <------ SOluciona el Retain Cycle
        SyncManager.shared.syncInformacion(success: { (_) in
            
        }) { (error) in
            self.showAlert(title: "Error", message: error.localizedDescription)
        }

    }
    
    // 4to esta por aparecer
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("La  lista de platos esta por aparecer")
    }
    
    // 5to aparecio el view controller
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        self.showAlert(title: "Info", message: "Claro pe mascota")
        print("La  lista de platos ya es visible")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("La  lista de platos esta por desaparecer")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("La  lista de platos desaparecio")
    }

    deinit {
        print("Desde el listado platos destructor")
    }
    
    // MARK: - NAVIGATION
    override func shouldPerformSegue(withIdentifier identifier: String,
                                     sender: Any?) -> Bool {

        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinoVC = segue.destination as? PlatoDetalleViewController,
            let celda = sender as? PlatoTableViewCell {
            destinoVC.plato = celda.plato
        }
    }
}

extension PlatosViewController:UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // func nombreMEtodo(Alias variable:Tipo, alias variable:Tipo) -> TipoRetorno
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return platos.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let id = PlatoTableViewCell.identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath)
        let platoCell = cell as! PlatoTableViewCell
        
        let plato = platos[indexPath.row]
        platoCell.plato = plato
        return platoCell
    }
    
    
}

extension PlatosViewController:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let plato = platos[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destinoVC = storyboard.instantiateViewController(withIdentifier: "PlatoDetalleViewController") as! PlatoDetalleViewController
        destinoVC.plato = plato
        
        self.navigationController?.pushViewController(destinoVC, animated: true)
        
    }
    
}










