//
//  AppCoordinator.swift
//  TopFundos
//
//  Created by Guilherme de Assis dos Santos on 27/10/21.
//

import UIKit

class AppCoordinator {
    let window: UIWindow
    let mainCoordinator = TopCoordinator()
    
    init(_ window: UIWindow) {
        self.window = window
    }
    
    func start() {
        window.rootViewController = mainCoordinator.start()
        window.makeKeyAndVisible()
    }
}
