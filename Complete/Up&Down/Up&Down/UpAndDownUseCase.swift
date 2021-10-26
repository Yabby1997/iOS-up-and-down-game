//
//  UpAndDownUseCase.swift
//  Up&Down
//
//  Created by Seunghun Yang on 2021/10/26.
//

import Foundation

class UpAndDownUseCase {
    private var answer: Int
    
    init() {
        self.answer = Int.random(in: 0...20)
    }
    
    func guess(with value: Int) -> Bool {
        return value == answer
    }
}
