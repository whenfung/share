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

    @discardableResult
    static func handleOpen(_ url: URL) -> Bool {
        QQApiInterface.handleOpen(url, delegate: helper)
        return TencentOAuth.handleOpen(url)
    }

    static func shareText(_ text: String) {
        let obj = QQApiTextObject(text: text)
        let req = SendMessageToQQReq(content: obj)
        let code = QQApiInterface.send(req)
        if code == .EQQAPISENDSUCESS {
            print("分享成功")
        }
    }

    static func shareImage(_ image: UIImage) {
        let data = image.pngData()
        let obj = QQApiImageObject(data: data,
                                   previewImageData: data,
                                   title: "title",
                                   description: "description")
        let req = SendMessageToQQReq(content: obj)
        let code = QQApiInterface.send(req)
        if code == .EQQAPISENDSUCESS {
            print("分享成功")
        }
    }
}

// MARK: - Delegate Class

extension Sdk.Qq {
    private class Helper: NSObject, TencentSessionDelegate, QQApiInterfaceDelegate {
        func onReq(_ req: QQBaseReq!) {
            print("接受到返回")
        }

        func onResp(_ resp: QQBaseResp!) {
            print("接受到返回")
        }

        func isOnlineResponse(_ response: [AnyHashable : Any]!) {
            print("接受到返回")
        }

        private var tencentOAuth: TencentOAuth?

        override init() {
            super.init()
            tencentOAuth = TencentOAuth(appId: "222222", andDelegate: self)
//            tencentOAuth.redirectURI = "www.professordeng.com"
        }

        func login() {
            let permissions: [Any] = [kOPEN_PERMISSION_GET_USER_INFO]
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
