//
//  SecondViewCoordinator.swift
//  Up&Down
//
//  Created by Seunghun Yang on 2021/11/07.
//

import UIKit

final class SecondViewCoordinator: BaseCoordinatorProtocol {
    var presenter: UINavigationController
    let value: Int
    
    init(presenter: UINavigationController, value: Int) {
        self.presenter = presenter
        self.value = value
    }
    
    func start() {
        let viewModel = SecondViewModel(value: value)
        let viewController = SecondViewController(viewModel: viewModel)
        self.presenter.pushViewController(viewController, animated: true)
    }
}
