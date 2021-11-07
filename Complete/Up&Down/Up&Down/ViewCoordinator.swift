//
//  ViewCoordinator.swift
//  Up&Down
//
//  Created by Seunghun Yang on 2021/11/07.
//

import UIKit

final class ViewCoordinator: ViewCoordinatorProtocol {
    var presenter: UINavigationController
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let upAndDownUseCase = UpAndDownUseCase()
        let viewModel = ViewModel(upAndDownUseCase: upAndDownUseCase, coordinatorDelegate: self)
        let viewController = ViewController(viewModel: viewModel, coordinator: self)
        self.presenter.pushViewController(viewController, animated: true)
    }
    
    func userDidPredictRightAnswer(value: Int) {
        let coordinator = SecondViewCoordinator(presenter: self.presenter, value: value)
        coordinator.start()
    }
}
