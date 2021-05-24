//
//  Sdk+Qq.swift
//  Share
//
//  Created by deng on 2021/5/24.
//

import Foundation

extension Sdk.Qq {
    private static let helper = Helper()
    private static var tencentOAuth: TencentOAuth?
    private static let permissions = ["get_user_info",
                                      "get_simple_userinfo",
                                      "add_t",
                                      nil]

    static func register() {
        tencentOAuth = TencentOAuth(appId: "222222", andDelegate: helper)
//        tencentOAuth?.redirectURI = "www.professordeng.com"
    }

    static func handleOpen(_ url: URL) -> Bool {
        TencentOAuth.handleOpen(url)
    }
}

// MARK: - Delegate Class

extension Sdk.Qq {
    private class Helper: NSObject, TencentSessionDelegate {
        func tencentDidLogin() {
            print("登录成功后的回调")
        }

        func tencentDidNotLogin(_ cancelled: Bool) {
            print("登录失败后的回调")
        }

        func tencentDidNotNetWork() {
            print("登录时网络有问题的回调")
        }
    }
}
