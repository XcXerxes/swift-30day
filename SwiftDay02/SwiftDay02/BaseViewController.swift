//
//  BaseViewController.swift
//  SwiftDay02
//
//  Created by leo on 15/01/2020.
//  Copyright © 2020 leo. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置导航栏的背景颜色
        navigationController?.navigationBar.barTintColor = Specs.color.tint
        // 设置导航栏返回按钮和字体的颜色
        navigationController?.navigationBar.tintColor = Specs.color.white
        // 设置导航栏的标题字体大小 和 字体颜色
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Specs.color.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: Specs.fontSize.mLarge)]
        // 设置view 的背景颜色
        view.backgroundColor = Specs.color.white
    }
}
