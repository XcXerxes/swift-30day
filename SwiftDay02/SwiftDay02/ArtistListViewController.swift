//
//  ArtistListViewController.swift
//  SwiftDay02
//
//  Created by leo on 15/01/2020.
//  Copyright © 2020 leo. All rights reserved.
//

import UIKit

class ArtistListViewController: BaseViewController {
    let artists = Artist.artistsFromBundle()
    private let tableView: UITableView = {
        // 创建tableView, 并添加控制器view
        let view = UITableView()
        // 注册单元格
        view.register(ArtistTableViewCell.self, forCellReuseIdentifier: ArtistTableViewCell.identifier)
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Artistry"
        
        // 代理 tableView
        tableView.dataSource = self
        tableView.delegate = self
        
        // 将 tableView 添加到视图中
        view.addSubview(tableView)
        
        // 设置 tableView 的布局
       // tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.snp.makeConstraints{make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44.0
//       view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[tableView]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["tableView" : tableView]))
//       view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[tableView]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["tableView": tableView]))
    }
}


extension ArtistListViewController: UITableViewDataSource {
    // 行的内容展示
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 创建一个单元格
        let cell = tableView.dequeueReusableCell(withIdentifier: ArtistTableViewCell.identifier, for: indexPath) as! ArtistTableViewCell
        // 获取当前的内容
        let artist = artists[indexPath.row]
        
        cell.bioImage?.image = artist.image
        cell.bioLabel?.text = artist.name
        cell.descriptionLabel?.text = artist.bio
        // 为了多行的文字自适应高度
        cell.descriptionLabel?.sizeToFit()
        // 选中时不会有样式
        cell.selectionStyle = .none
        return cell
    }
    
    // 行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artists.count
    }
}

extension ArtistListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 获取当条的数据
        let artist = artists[indexPath.row]
        let detailViewController = ArtistDetailViewController()
        detailViewController.selectedArtist = artist
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
