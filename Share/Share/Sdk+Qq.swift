//
//  Sdk+Qq.swift
//  Share
//
//  Created by deng on 2021/5/24.
//

import Foundation

extension Sdk.Qq {
    private static let helper = Helper()

    static func login() {
        helper.login()
    }

    static func handleOpen(_ url: URL) -> Bool {
        TencentOAuth.handleOpen(url)
    }
}

// MARK: - Delegate Class

extension Sdk.Qq {
    private class Helper: NSObject, TencentSessionDelegate {
        private var tencentOAuth: TencentOAuth?

        override init() {
            super.init()
            tencentOAuth = TencentOAuth(appId: "222222", andDelegate: self)
//            tencentOAuth.redirectURI = "www.professordeng.com"
        }

        func login() {
            let permissions: [Any] = ["get_user_info"]
            tencentOAuth?.authorize(permissions)
        }

        func tencentDidLogin() {
            print("登录完成")
            if let token = tencentOAuth?.accessToken {
                print(token)
                print(tencentOAuth?.openId ?? "no open id")
                print(tencentOAuth?.expirationDate ?? "no expiratin date")
            } else {
                print("登录不成功，没有获取到 access token")
            }
        }

        func tencentDidNotLogin(_ cancelled: Bool) {
            if cancelled {
                print("用户取消登录")
            } else {
                print("登录失败")
            }
        }

        func tencentDidNotNetWork() {
            print("无网络连接，请设置网络")
        }
    }
}
