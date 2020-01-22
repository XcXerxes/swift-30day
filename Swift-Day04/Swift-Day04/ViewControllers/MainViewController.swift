//
//  MainViewController.swift
//  Swift-Day04
//
//  Created by leo on 1/21/20.
//  Copyright © 2020 leo. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {
    // 定义缩略图的大小
    let thumbnailSIze: CGFloat = 70.0
    // 定义图片的数组
    let photos = ["photo1", "photo2", "photo3", "photo4", "photo5"]
    var collectionView: UICollectionView = {
        let v1 = UICollectionViewFlowLayout()
        v1.minimumInteritemSpacing = 5
        let view = UICollectionView.init(frame: .zero, collectionViewLayout: v1)
        view.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.identifier)
        // 注册单元格
        return view
    }()
    // var collectionView: UICollectionView
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "图片展示"
        makeCollectionView()
    }
    func makeCollectionView() {
        // 设置 layout
        // collectionView = UICollectionView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = Specs.color.white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[collectionView]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["collectionView" : collectionView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[collectionView]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["collectionView": collectionView]))
    }
}
// MARK: collectionView 数据源
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.identifier, for: indexPath) as! PhotoCell
        let image = UIImage(named: photos[indexPath.row])
        cell.imageView.image = image
        return cell
    }
    
    // 设置多少组
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    // 数据的总数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
}


// MARK: collectionLayout 协议

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print("======================1")
        return CGSize(width: thumbnailSIze, height: thumbnailSIze)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        print("======================2")
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
}


extension UIImage {
  func thumbnailOfSize(_ size: CGFloat) -> UIImage {
    UIGraphicsBeginImageContext(CGSize(width: size, height: size))
    let rect = CGRect(x: 0.0, y: 0.0, width: size, height: size)
    UIGraphicsBeginImageContext(rect.size)
    draw(in: rect)
    let thumbnail = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext()
    return thumbnail!
  }
}
