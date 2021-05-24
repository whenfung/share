//
//  AppDelegate.swift
//  Share
//
//  Created by deng on 2021/5/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var tencentOauth: TencentOAuth?
    let permissions = ["get_user_info", "get_simple_userinfo", "add_t", nil]

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        TencentOAuth.handleOpen(url)
    }

    func application(_ application: UIApplication, handleOpen url: URL) -> Bool {
        TencentOAuth.handleOpen(url)
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        tencentOauth = TencentOAuth(appId: "222222", andDelegate: self)
//        tencentOauth?.redirectURI = "www.markji.com"

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

extension AppDelegate: TencentSessionDelegate {
    func tencentDidLogin() {}
    func tencentDidNotLogin(_ cancelled: Bool) {}
    func tencentDidNotNetWork() {}
}
