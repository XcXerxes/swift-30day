//
//  ArtistDetailViewController.swift
//  SwiftDay02
//
//  Created by leo on 15/01/2020.
//  Copyright © 2020 leo. All rights reserved.
//

import UIKit

class ArtistDetailViewController: BaseViewController {
    var selectedArtist: Artist!
    let moreInfoText = "更多..."
    private let tableView: UITableView = {
        // 创建tableView, 并添加控制器view
        let view = UITableView()
        // 注册单元格
        view.register(WorkTableViewCell.self, forCellReuseIdentifier: WorkTableViewCell.identifier)
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectedArtist.name
        
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        // 设置 tableView 的布局
         tableView.snp.makeConstraints{make in
             make.top.equalToSuperview()
             make.bottom.equalToSuperview()
             make.left.equalToSuperview()
             make.right.equalToSuperview()
         }
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
    }
//    func rows (indexPath: Int) -> [Any] {
//        return selectedArtist.works[indexPath] as! [Any]
//    }
}

extension ArtistDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedArtist.works.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 创建一个单元格
        let cell = tableView.dequeueReusableCell(withIdentifier: WorkTableViewCell.identifier, for: indexPath) as! WorkTableViewCell
        // 获取当前行的信息
        let work = selectedArtist.works[indexPath.row]
        // 设置图片的地址
        cell.workImageView?.image = work.image
        cell.workImageView?.contentMode = .scaleAspectFit
        // 设置标题
        cell.workLabel?.text = work.title
        // 设置详情内容
        cell.workInfoLabel?.text = work.info
        // 自适应高度
        cell.workInfoLabel?.sizeToFit()
        // 选中时不会有样式
        cell.selectionStyle = .none
        return cell
    }
}

extension ArtistDetailViewController: UITableViewDelegate {
    
}

