//
//  MasterViewController.swift
//  SwiftDay03
//
//  Created by leo on 1/16/20.
//  Copyright © 2020 leo. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    // MARK: - 属性
    let candies = Candy.initCandies()
    var filteredCandies = [Candy]()
    // 初始化 搜索控制器 如果 searchResultsController 指定值， 表示用来显示搜索结果
    let searchController = UISearchController(searchResultsController: nil)
    // MARK: - 初始化
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 初始化导航
        initTitle()
        // 初始化搜索控制器
        setupSearchController()
    }
    
    // MARK: - 设置导航标题Logo
    private func initTitle () {
        // 导航栏背景颜色
        navigationController?.navigationBar.barTintColor = Specs.color.candyGreen
        let titleImageView = UIImageView(image: UIImage(named: Specs.imageName.inlineLogo))
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
    }
    
    // MARK: - 搜索控制器 初始化
    func setupSearchController () {
        // 用来 代理用户输入 的内容
        searchController.searchResultsUpdater = self
        // 确保当 UISearchController 为活跃状态时，用户导航到了新的 ViewController（如从搜索结果）， 搜索栏还在屏幕最上方
        definesPresentationContext = true
        // 创建一个分段的 过滤控件
        searchController.searchBar.scopeButtonTitles = ["All", "Chocolate", "Hard", "Other"]
        // 设置 搜索栏的 背景色
        searchController.searchBar.barTintColor = Specs.color.candyGreen
        // 设置搜索栏的文字颜色
        searchController.searchBar.tintColor = Specs.color.white
        searchController.searchBar.placeholder = "Candy Search"
        // 代理搜索框
        searchController.searchBar.delegate = self
        // 设置当 选中 搜索框时 是否 显示 模糊的背景
        searchController.obscuresBackgroundDuringPresentation = false
        if #available(iOS 11, *) {
            // 如果大于 ios 11 就将 搜索控制器添加 到 导航栏里
            self.navigationItem.searchController = searchController
            self.navigationItem.searchController?.isActive = true
            self.navigationItem.hidesSearchBarWhenScrolling = false
        } else {
            tableView.tableHeaderView = searchController.searchBar
        }
    }
    
    func filterContentForSearchText (_ searchText: String, scope: String = "All") {
        filteredCandies = candies.filter { candy in
            if !(candy.category == scope) && scope != "All" {
                return false
            }
            return candy.name.lowercased().contains(searchText.lowercased()) || searchText == ""
        }
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
    }
    // MARK: - tableView
    override func numberOfSections(in tableView: UITableView) -> Int {
      return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            return filteredCandies.count
        }
        return candies.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "Cell")
        let candy: Candy
        // 判断如果是在搜索中，就从 搜索的列表拿到值 否则就从默认的列表拿到值
        if searchController.isActive {
            candy = filteredCandies[(indexPath as NSIndexPath).row]
        } else {
            candy = candies[(indexPath as NSIndexPath).row]
        }
        cell.textLabel?.text = candy.name
        cell.detailTextLabel?.text = candy.category
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailView = DetailViewController()
        if searchController.isActive {
            detailView.detailCandy = filteredCandies[(indexPath as NSIndexPath).row]
        } else {
            detailView.detailCandy = candies[(indexPath as NSIndexPath).row]
        }
        navigationController?.pushViewController(detailView, animated: true)
    }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 48.0
    }
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerLable = UILabel()
        footerLable.backgroundColor = Specs.color.candyGreen
        footerLable.textColor = Specs.color.white
        footerLable.textAlignment = .center
        footerLable.text = "Filtering \(filteredCandies.count) of \(candies.count)"
        return footerLable
    }
}


// MARK: - 扩展
extension MasterViewController: UISearchResultsUpdating {
    // 搜索内容发生变化时 触发
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        print("scope================\(searchBar.text)")
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!, scope: scope)
    }
}

extension MasterViewController: UISearchBarDelegate {
    // 切换分段控件时 触发
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        print("scope================\(selectedScope)")
        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}
