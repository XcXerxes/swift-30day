//
//  MeViewController.swift
//  SwiftDay01
//
//  Created by leo on 14/01/2020.
//  Copyright © 2020 leo. All rights reserved.
//

import UIKit
class MeViewController: UIViewController {
    // 用来将已知的类型 重新命名一個类型
    typealias RowModel = [String: String]
    // 表示代码可以在当前文件中被访问，而不做类型限定
    fileprivate var user: FBMeUser {
        get {
            return FBMeUser(name: "BayMax", education: "CMU")
        }
    }
    fileprivate var tableViewDataSource: [[String: Any]] {
        get {
            return TableKeys.populate(withUser: user)
        }
    }
    private let tableView: UITableView = {
        // 创建tableView, 并添加控制器的view
        let view = UITableView(frame: .zero, style: .grouped)
        // 注册列
        view.register(FBMeCell.self, forCellReuseIdentifier: FBMeCell.identifier)
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置背景
        view.backgroundColor = Specs.color.gray
        // 设置标题
        title = "Facebook"
        // 设置导航头部的背景色
        navigationController?.navigationBar.barTintColor = Specs.color.tint
        // 代理 tableView
        tableView.delegate = self
        tableView.dataSource = self
        // 将tableView 添加到视图中
        view.addSubview(tableView)
        
        // 设置 tableView 的布局
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[tableView]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["tableView" : tableView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[tableView]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["tableView": tableView]))
    }
    fileprivate func rows(at section: Int) -> [Any] {
        return tableViewDataSource[section][TableKeys.Rows] as! [Any]
    }
    func title(at section: Int) -> String? {
        return tableViewDataSource[section][TableKeys.Section] as? String
    }
    fileprivate func rowModel(at indexPath: IndexPath) -> RowModel {
        return rows(at: indexPath.section)[indexPath.row] as! RowModel
    }
}

// Swift中类的扩展：实现数据源
extension MeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewDataSource.count
    }
    // MARK: - UITableViewDataSource数据源
    // 必须实现 UITableViewDataSource的option修饰的必须实现的方法，否则会报错
    
    // 表示 一个cell中展示几行
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 根据定义的枚举 展示每个 cell 中的行数
        return rows(at: section).count
    }
    // 返回头部的标题
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return title(at: section)
    }
    // 单个单元格的展示
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 得到当前 cell 中 当前 row 的 数据
        let modelForRow = rowModel(at: indexPath)
        // 创建cell
        var cell = UITableViewCell()
        // 如果 model 中对应的 title 不在 TableKeys.Title中 就直接返回单元格
        guard let title = modelForRow[TableKeys.Title] else {
            return cell
        }
        // 如果 标题的名字 === user模型 的 名字 表示是 头像那行
        if title == user.name {
            // 初始化 cell 同时设置 样式包含 subtitle
            cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: nil)
        } else {
            // 创建 cell, 此时cell 是可选类型
            cell = tableView.dequeueReusableCell(withIdentifier: FBMeCell.identifier, for: indexPath)
        }
        // 如果有 textLabel 就给 text 赋值标题
        cell.textLabel?.text = title
        // 如果 当前row 的模型中 有 图片的名称
        if let imageName = modelForRow[TableKeys.ImageName] {
            // 就创建一个 图片视图，同时图片源为 从row 模型中得到的图片地址
            cell.imageView?.image = UIImage(named: imageName)
        } else if title != TableKeys.logout {
            cell.imageView?.image = UIImage(named: Specs.imageName.placeholder)
        }
        if title == user.name {
            // 如果是 用户 那一行 就设置 副标题的 内容为
            cell.detailTextLabel?.text = modelForRow[TableKeys.SubTitle]
        }
        return cell
    }
}

// 实现 tableView的代理
extension MeViewController: UITableViewDelegate {
    // 返回每 row 的高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let modelForRow = rowModel(at: indexPath)
        guard let title = modelForRow[TableKeys.Title] else {
            return 0.0
        }
        if title == user.name {
            return 64.0
        } else {
            return 44.0
        }
    }
    // 选中点击时
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let modelForRow = rowModel(at: indexPath)
        // print("\(model)")
         guard let title=modelForRow[TableKeys.Title] else {
            return
        }
        if title == "Settings" {
            self.navigationController?.pushViewController(SettingController(), animated: true)
        }
    }
    // 样式展示设置
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let modelForRow = rowModel(at: indexPath)
        guard let title=modelForRow[TableKeys.Title] else {
            return
        }
        if title == TableKeys.seeMore || title == TableKeys.addFavorites {
            // 设置标题的颜色
            cell.textLabel?.textColor = Specs.color.tint
            // 设置 单元使用的标准附件控件的类型 为空
            // cell.accessoryType = .none
            cell.accessoryView = UISwitch()
        } else if title == TableKeys.logout {
            cell.textLabel?.centerXAnchor.constraint(equalTo: cell.centerXAnchor).isActive = true
            // 设置颜色
            cell.textLabel?.textColor = Specs.color.red
            // 设置居中
            cell.textLabel?.textAlignment = .center
            cell.accessoryType = .none
        } else {
            // 设置单元格右侧的 附件为箭头
            cell.accessoryType = .disclosureIndicator
        }
    }
}
