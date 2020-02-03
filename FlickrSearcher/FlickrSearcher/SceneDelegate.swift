//
//  SceneDelegate.swift
//  FlickrSearcher
//
//  Created by CHI on 2020/1/24.
//  Copyright © 2020 CHI. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = configureRootViewController()
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}

extension SceneDelegate {
    private func configureRootViewController() -> UIViewController {
        let tabBarController = UITabBarController()
        let searchNavigationController = UINavigationController(rootViewController: SearchViewController())
        
        let favoriteNavigationController = UINavigationController(rootViewController: FavoriteViewController())
        
        tabBarController.viewControllers = [searchNavigationController, favoriteNavigationController]
        
        tabBarController.tabBar.items?[0].image = UIImage(named: "tabBar_search")
        tabBarController.tabBar.items?[0].title = "輸入搜尋"
        tabBarController.tabBar.items?[1].image = UIImage(named: "tabBar_favorite")
        tabBarController.tabBar.items?[1].title = "我的最愛"

        return tabBarController
    }
}

