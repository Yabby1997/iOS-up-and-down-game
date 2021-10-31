//
//  AppCoordinator.swift
//  Up&Down
//
//  Created by Seunghun Yang on 2021/10/31.
//

import UIKit

final class AppCoordinator: Coordinator {
    func start() {
        let upAndDownUseCase = UpAndDownUseCase()
        let viewModel = ViewModel(upAndDownUseCase: upAndDownUseCase)
        let viewController = ViewController(viewModel: viewModel, coordinator: self)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
