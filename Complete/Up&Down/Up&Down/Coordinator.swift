//
//  Coordinator.swift
//  Up&Down
//
//  Created by Seunghun Yang on 2021/10/31.
//

import UIKit

class Coordinator {
    var childCoordinators: [Coordinator] = []
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
}
