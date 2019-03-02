//
//  LoginViewController.swift
//  Restaurante
//
//  Created by Arturo Gamarra on 2/23/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "PresentListaPlatosViewController",
                          sender: self)
        
        
    }
    

}
