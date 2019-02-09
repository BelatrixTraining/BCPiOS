//
//  PlatosViewController.swift
//  Restaurante
//
//  Created by Arturo Gamarra on 2/9/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//

import UIKit

extension String {
    
    func toInt() -> Int? {
        return Int(self)
    }
    
}

class PlatosViewController: UIViewController {

    static let cellId = "PlatoSimpleCell"
    
    @IBOutlet weak var tableView: UITableView!
    var platos:[String] = []
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        platos = ["Sopa wantan", "Chaufa de Choi", "Ceviche", "Lomo Saltado", "Tiramisu"]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

extension PlatosViewController:UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // func nombreMEtodo(Alias variable:Tipo, alias variable:Tipo) -> TipoRetorno
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return platos.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let id = PlatosViewController.cellId
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath)
        
        let plato = platos[indexPath.row]
        cell.textLabel?.text = plato
        cell.detailTextLabel?.text = "Precio: S/ 10"
        return cell
    }
    
    
}

extension PlatosViewController:UITableViewDelegate {
    
}










