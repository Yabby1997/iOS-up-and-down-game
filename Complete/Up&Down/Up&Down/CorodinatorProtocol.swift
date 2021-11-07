//
//  BaseCoordinatorProtocol.swift
//  Up&Down
//
//  Created by Seunghun Yang on 2021/11/07.
//

import UIKit

protocol BaseCoordinatorProtocol {
    var presenter: UINavigationController { get }
    
    func start()
}
