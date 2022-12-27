//
//  AppDelegate.swift
//  NoticeAppRoadToDev
//
//  Created by Кабулов Нурсултан Пернебаевич on 25.12.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    let splashViewController = SplashViewController()
    let noticesViewController = UINavigationController(rootViewController: NoticesViewController())



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        splashViewController.delegate = self

        displayNextScreen()
        return true
    }

    private func displayNextScreen() {
        if LocalState.hasOnboarded {
            setRootViewController(noticesViewController)
        } else {
            setRootViewController(splashViewController)
        }
    }
}

extension AppDelegate: SplashViewControllerDelegate {
    func didDone() {
        LocalState.hasOnboarded = true
        setRootViewController(noticesViewController)
    }
}

extension AppDelegate {
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = window.self else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }

        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
}
