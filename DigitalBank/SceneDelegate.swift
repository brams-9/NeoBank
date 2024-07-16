//
//  SceneDelegate.swift
//  DigitalBank
//
//  Created by Rahman Bramantya on 16/07/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let vc = ProductListWireFrame().getViewController()
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.navigationBar.barTintColor = .lightGray
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

}

