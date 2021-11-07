//
//  ViewModel.swift
//  Up&Down
//
//  Created by Seunghun Yang on 2021/10/26.
//

import Combine
import Foundation

class ViewModel {
    
    // MARK: - Private Properties
    
    private let upAndDownUseCase: UpAndDownUseCase
    private let coordinator: ViewCoordinatorProtocol
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Public Properties
    
    @Published var currentValue: Int = 10
    @Published var isAnswer: Bool = false
    
    // MARK: - Initializers
    
    init(upAndDownUseCase: UpAndDownUseCase, coordinatorDelegate: ViewCoordinatorProtocol) {
        self.upAndDownUseCase = upAndDownUseCase
        self.coordinator = coordinatorDelegate
        self.bind()
    }
    
    private func bind() {
        self.$isAnswer
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isAnswer in
                guard let self = self,
                      isAnswer else { return }
                self.coordinator.userDidPredictRightAnswer(value: self.currentValue)
            }
            .store(in: &cancellables)
    }
    
    func valueEdittingDidEnd() {
        isAnswer = upAndDownUseCase.guess(with: currentValue)
    }
}
