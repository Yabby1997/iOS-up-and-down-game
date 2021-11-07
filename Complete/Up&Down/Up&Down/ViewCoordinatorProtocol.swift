//
//  ViewCoordinatorProtocol.swift
//  Up&Down
//
//  Created by Seunghun Yang on 2021/11/07.
//

import Foundation

protocol ViewCoordinatorProtocol: BaseCoordinatorProtocol {
    func userDidPredictRightAnswer(value: Int)
}
