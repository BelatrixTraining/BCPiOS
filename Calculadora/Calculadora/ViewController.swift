//
//  ViewController.swift
//  Calculadora
//
//  Created by Arturo Gamarra on 1/26/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//

import UIKit
import Core

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    var number:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let _ = Dummy()
    }

    @IBAction func numberTapped(_ sender: UIButton) {
        let digit = sender.titleLabel!.text!
        number += digit
        resultLabel.text = number
    }
    
}

