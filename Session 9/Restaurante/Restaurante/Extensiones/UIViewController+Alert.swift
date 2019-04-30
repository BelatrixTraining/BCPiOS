//
//  UIViewController+Alert.swift
//  Restaurante
//
//  Created by Arturo Gamarra on 2/23/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showAlert(title:String, message:String) {
        let alertVC = UIAlertController(title: title,
                                        message: message,
                                        preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default) { (_) in
                                        
                                        print("Ok press")
        }
        alertVC.addAction(okAction)
        self.present(alertVC, animated: true, completion: nil)
    }
    
}
