//
//  PhotoCell.swift
//  Swift-Day04
//
//  Created by leo on 1/21/20.
//  Copyright © 2020 leo. All rights reserved.
//

import UIKit
import SnapKit

class PhotoCell: UICollectionViewCell {
    var imageView: UIImageView!
    static let identifier = "photoCell"
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
        contentView.addSubview(imageView!)
        imageView!.snp.makeConstraints{make in
            make.top.bottom.left.right.equalTo(contentView)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
