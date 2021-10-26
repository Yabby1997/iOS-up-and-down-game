//
//  ViewModel.swift
//  Up&Down
//
//  Created by Seunghun Yang on 2021/10/26.
//

import Foundation

class ViewModel {
    
    // MARK: - Private Properties
    
    private let upAndDownUseCase: UpAndDownUseCase
    
    // MARK: - Public Properties
    
    @Published var currentValue: Int = 10
    @Published var isAnswer: Bool = false
    
    // MARK: - Initializers
    
    init(upAndDownUseCase: UpAndDownUseCase) {
        self.upAndDownUseCase = upAndDownUseCase
    }
    
    func valueEdittingDidEnd() {
        isAnswer = upAndDownUseCase.guess(with: currentValue)
    }
}
