//
//  SceneDelegate.swift
//  Up&Down
//
//  Created by Seunghun Yang on 2021/10/26.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let navigationController = UINavigationController()
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navigationController
        let appCoordinator = AppCoordinator(presenter: navigationController)
        appCoordinator.start()
        window?.makeKeyAndVisible()
    }
}
