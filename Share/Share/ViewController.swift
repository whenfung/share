//
//  ViewController.swift
//  Share
//
//  Created by deng on 2021/5/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    private let shareItems = ShareType.allCases
    private let cellIdentifier = "CellIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        shareItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        cell.textLabel?.text = shareItems[indexPath.row].rawValue
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch shareItems[indexPath.row] {
        case .wechat:
            print("微信分享")
        case .moment:
            print("朋友圈分享")
        case .qq:
            print("QQ 分享")
        case .qzone:
            print("QQ 空间分享")
        case .weibo:
            print("微博分享")
        }
    }
}

enum ShareType: String, CaseIterable {
    case wechat
    case moment
    case qq
    case qzone
    case weibo
}
