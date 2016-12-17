//
//  ArticleViewController.swift
//  FKShop
//
//  Created by yeeku on 16/6/16.
//  Copyright © 2016年 org.crazyit. All rights reserved.
//

import UIKit

let cellID = "cellID"
class ArticleViewController: UIViewController, UITableViewDataSource,
	UITableViewDelegate {
	var code : String! // 当前视图需要显示的商品类型的code
	var articleArray = [Article]()  // UITableView需要显示的数据
	var hud: MBProgressHUD!	 // 提示控件
	var tableView : UITableView!  // 显示数据的UITableView
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = UIColor.white
		self.navigationItem.titleView = FKUtils.getCustomLaber("物品分类")
		// 创建UITableView
		tableView = UITableView(frame:CGRect(x: 0, y: 0,
			width: GLOBLE_BOUNDS_WIDTH(), height: GLOBLE_BOUNDS_HEIGHT() - 84), style:.plain)
		tableView.dataSource = self
		tableView.delegate = self
		// 设置行高
		tableView.rowHeight = GLOBLE_BOUNDS_HEIGHT() * 0.23
		// tableview隐藏多余的分割线，tableview没有数据的时候不显示线
		tableView.tableFooterView = UIView()
		self.view.addSubview(tableView)
	}
	override func viewWillAppear(_ animated: Bool){
		super.viewWillAppear(animated)
		// 创建提示控件
		hud = MBProgressHUD()
		// 设置提示控件信息
		hud.labelText = "正在载入网络数据..."
		// 显示提示控件
		hud.show(true)
		// 将提示控件添加到视图上
		self.view.addSubview(hud)
		let url = ARTICLE_ACTION + self.code
		// 异步请求数据
		FKNetworkingUtil.getArticleData(
			asynchronous: {[unowned self] array in
			// 获取数据
			self.articleArray = array as! [Article]
			// 移除hud控件
			self.hud.removeFromSuperview()
			// 刷新tableView显示的数据
			self.tableView.reloadData()
			}, url:url, params:nil)
	}
	// 返回各分区内包含的表格行的数量（articleArray数组有多少个元素，就显示多少个表格行）
	func tableView(_ tableView: UITableView, numberOfRowsInSection
		section: Int) -> Int {
		return articleArray.count == 0 ? 0 : articleArray.count
	}
	// 返回表格内每个单元格的控件
	func tableView(_ tableView: UITableView, cellForRowAt
		indexPath: IndexPath) -> UITableViewCell {
		var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
			as! ArticleTableViewCell?
		// 如果cell为空，则创建自定义的ArticleTableViewCell表格行控件
		if cell == nil {
			cell = ArticleTableViewCell(style:.default, reuseIdentifier:cellID)
		}
		// 根据行号获得对应的Article对象
		let article = articleArray[indexPath.row]
		// 网络读取图片数据
		let imageURL = FKSHOP_IMAGES_ARTICLE + article.image
		let image = FKNetworkingUtil.getImageWithURLPath(imageURL)
		// 设置图片
		cell!.articleImageView.image = image
		// 设置商品标题
		cell!.titleLabel.text = article.title
		// 设置商品供应商
		cell!.supplierLabel.text = article.supplier
		// 设置商品的价格，保留两位小数
		cell!.priceLabel.text = String(format:
			"￥：%.2lf", article.price.doubleValue)
		return cell!
	}
	// 当选中某个表格行时激发该方法
	func tableView(_ tableView: UITableView,
		didSelectRowAt indexPath:IndexPath){
		// 获取商品信息
		let article = articleArray[indexPath.row]
		// 创建商品详情视图
		let detailViewController = DetailViewController()
		// 传递商品信息
		detailViewController.article = article
		// 显示指定商品详情的视图控制器
		self.navigationController!.pushViewController(detailViewController,
													 animated:true)
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
}
