//
//  AppCoordinator.swift
//  Up&Down
//
//  Created by Seunghun Yang on 2021/10/31.
//

import UIKit

final class AppCoordinator: BaseCoordinatorProtocol {
    var presenter: UINavigationController
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let coordinator = ViewCoordinator(presenter: self.presenter)
        coordinator.start()
    }
}
