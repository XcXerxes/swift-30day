//
//  DetailViewController.swift
//  SwiftDay03
//
//  Created by leo on 1/16/20.
//  Copyright © 2020 leo. All rights reserved.
//

import UIKit
import SnapKit

class DetailViewController: BaseViewController {
    var detailCandy: Candy? {
        // 计算 detailCandy 的变化
        didSet {
            configureView()
        }
    }
    var titleLabel: UILabel?
    var candyImageView: UIImageView?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Specs.color.white
        titleLabel = UILabel()
        titleLabel?.textColor = Specs.color.black
        titleLabel?.textAlignment = .center
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        view.addSubview(titleLabel!)
        titleLabel?.snp.makeConstraints{make in
            make.top.equalTo(view.snp.top).offset(90)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.height.equalTo(40)
        }
        
        candyImageView = UIImageView()
        view.addSubview(candyImageView!)
        candyImageView?.snp.makeConstraints{make in
            make.top.equalTo((titleLabel?.snp.bottom)!).offset(10)
            make.left.right.equalTo(titleLabel!)
            make.bottom.equalTo(view).offset(-40)
        }
        configureView()
    }
    
    func configureView () {
        if let candy = detailCandy {
            titleLabel?.text = candy.name
            candyImageView?.image = UIImage(named: candy.name)
            title = candy.category
        }
    }
}
