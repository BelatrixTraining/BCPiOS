//
//  AppeanceManager.swift
//  Restaurante
//
//  Created by Arturo Gamarra on 3/2/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//

import UIKit

class AppearanceManager {
    
    // MARK: - SINGLETON
    static let shared = AppearanceManager()
    
    func setupAppAppearance() {
        
        let tabBar = UITabBar.appearance()
        tabBar.barTintColor = .orange
        tabBar.tintColor = .white
        
        let navBar = UINavigationBar.appearance()
        navBar.barTintColor = .orange
        navBar.tintColor = .white
        
        
    }
    
}
