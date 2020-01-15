//
//  ArtistTableViewCell.swift
//  SwiftDay02
//
//  Created by leo on 15/01/2020.
//  Copyright © 2020 leo. All rights reserved.
//

import UIKit
import SnapKit

class ArtistTableViewCell: UITableViewCell {
    var bioImage: UIImageView?
    var descriptionLabel: UILabel?
    var bioLabel: UILabel?
    static let identifier = "ArtistTableViewCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initView()
    }
    func initView() {
        bioImage = UIImageView()
        self.contentView.addSubview(bioImage!)
        bioImage!.snp.makeConstraints{ make in
            make.top.equalTo(contentView).offset(10)
            make.left.equalTo(contentView).offset(10)
            make.bottom.equalTo(contentView).offset(-41)
            make.width.equalTo(207)
        }

        self.descriptionLabel = UILabel()
        self.descriptionLabel?.textColor = Specs.color.gray
        self.descriptionLabel?.numberOfLines = 0
        self.descriptionLabel?.font = UIFont.systemFont(ofSize: Specs.fontSize.mLarge)
        self.contentView.addSubview(self.descriptionLabel!)
        self.descriptionLabel?.snp.makeConstraints{make in
            make.top.equalTo(bioImage!.snp.top)
            make.left.equalTo(bioImage!.snp.right).offset(10)
            make.right.equalTo(contentView).offset(-10)
            make.centerY.equalToSuperview()
        }
        
        
        self.bioLabel = UILabel()
        self.bioLabel?.backgroundColor = Specs.color.orange
        self.bioLabel?.textColor = Specs.color.white
        // 居中
        self.bioLabel?.textAlignment = .center
        self.contentView.addSubview(self.bioLabel!)
        self.bioLabel?.snp.makeConstraints{make in
            make.height.equalTo(21)
            make.bottom.equalTo(contentView).offset(-10)
            make.left.right.equalTo(self.bioImage!)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
