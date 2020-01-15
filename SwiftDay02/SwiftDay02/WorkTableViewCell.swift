//
//  WorkTableViewCell.swift
//  SwiftDay02
//
//  Created by leo on 15/01/2020.
//  Copyright © 2020 leo. All rights reserved.
//

import UIKit

class WorkTableViewCell: UITableViewCell {
    var workImageView: UIImageView?
    var workLabel: UILabel?
    var workInfoLabel: UILabel?
    static let identifier = "WorkTableViewCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initView()
    }
    
    func initView () {
        // 图片容器
        workImageView = UIImageView()
        contentView.addSubview(workImageView!)
        workImageView?.snp.makeConstraints{make in
            make.top.equalTo(contentView).offset(10)
            make.left.equalTo(contentView).offset(10)
            make.right.equalTo(contentView).offset(-10)
        }
        
        // 标题容器
        workLabel = UILabel()
        contentView.addSubview(workLabel!)
        workLabel?.backgroundColor = Specs.color.gray
        workLabel?.textColor = Specs.color.white
        workLabel?.textAlignment = .center
        // 设置圆角
        workLabel?.layer.cornerRadius = 4
        workLabel?.layer.masksToBounds = true
        workLabel?.snp.makeConstraints{make in
            make.top.equalTo((workImageView?.snp.bottom)!).offset(15)
            make.left.right.equalTo(workImageView!)
            make.height.equalTo(30)
        }
        
        // 详情容器
        workInfoLabel = UILabel()
        contentView.addSubview(workInfoLabel!)
        workInfoLabel?.snp.makeConstraints{make in
            make.top.equalTo((workLabel?.snp.bottom)!).offset(10)
            make.left.right.equalTo(workLabel!)
            make.bottom.equalTo(contentView).offset(-10)
        }
        workInfoLabel?.numberOfLines = 0
        workInfoLabel?.textColor = Specs.color.gray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
