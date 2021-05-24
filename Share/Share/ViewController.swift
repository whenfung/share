//
//  ViewController.swift
//  Share
//
//  Created by deng on 2021/5/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    private let oauthItems = OauthType.allCases
    private let cellIdentifier = "CellIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        oauthItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        cell.textLabel?.text = oauthItems[indexPath.row].rawValue
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch oauthItems[indexPath.row] {
        case .shareToWechat:
            print("微信分享")
        case .shareToMoment:
            print("朋友圈分享")
        case .shareToQQ:
            Sdk.Qq.shareText("祝你天天开心")
        case .shareToQzone:
            print("QQ 空间分享")
        case .shareToWeibo:
            print("微博分享")
        case .loginByWechat:
            print("微信登录")
        case .loginByQQ:
            Sdk.Qq.login()
        case .loginByWeibo:
            print("微博登录")
        }
    }
}

enum OauthType: String, CaseIterable {
    case shareToWechat = "分享到微信"
    case shareToMoment = "分享到朋友圈"
    case shareToQQ = "分享到 QQ"
    case shareToQzone = "分析到 QQ 空间"
    case shareToWeibo = "分析到微博"

    case loginByWechat = "微信登录"
    case loginByQQ = "QQ 登录"
    case loginByWeibo = "微博登录"
}
