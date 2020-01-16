//
//  ViewController.swift
//  SwiftDay03
//
//  Created by leo on 1/16/20.
//  Copyright © 2020 leo. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 导航栏背景颜色
        navigationController?.navigationBar.barTintColor = Specs.color.candyGreen
        navigationController?.navigationBar.tintColor = Specs.color.white
        // 导航的字体颜色
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Specs.color.white]
        
    }
}

extension UINavigationController {
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
