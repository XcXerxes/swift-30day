//
//  BaseViewController.swift
//  Swift-Day04
//
//  Created by leo on 1/21/20.
//  Copyright © 2020 leo. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置导航栏颜色
        navigationController?.navigationBar.tintColor = Specs.color.black
        
        // 设置视图的背景颜色为 白色
        view.backgroundColor = Specs.color.white
    }
}
