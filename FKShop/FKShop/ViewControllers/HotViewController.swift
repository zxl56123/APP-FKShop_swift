//
//  HotViewController.swift
//  FKShop
//
//  Created by yeeku on 16/6/16.
//  Copyright © 2016年 org.crazyit. All rights reserved.
//

import UIKit

let imageCount = 5
let rowCellCount = 2
let hotItemCount = 6  // 热点数据最多显示6条
let scrollViewHeight = GLOBLE_BOUNDS_HEIGHT() * 0.25
class HotViewController: UIViewController, UIScrollViewDelegate,
	UITableViewDataSource {
	var pageControl:UIPageControl!  // 分页控件
	var articleArray = [Article]() // UITableView需要显示的数据
	var hud: MBProgressHUD! // 提示控件
	var tableView: UITableView!  // 显示数据的UITableView
	var hotItemCount = 6
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		// 获取该选项卡底部选项按钮未选中时的图片
		let unselectImage = UIImage(named:HOMENMPNG)
		// 获取该选项卡底部选项按钮选中时的图片
		let selectImage = UIImage(named:HOMEONPNG)
		// 创建一个UITabBarItem
		let item = UITabBarItem(title:"主页",
			image:unselectImage!.withRenderingMode(.alwaysOriginal),
			selectedImage:selectImage!.withRenderingMode(.alwaysOriginal))
		// 设置tag
		item.tag = 0
		// 将创建的UITabBarItem设置为视图控制器的TabBarItem
		self.tabBarItem = item
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		/******************界面上方显示轮播的5张广告图片******************/
		// 创建一个滚动视图
		let scrollView = UIScrollView(frame:CGRect(x: 0, y: 0, width: GLOBLE_BOUNDS_WIDTH(), height: scrollViewHeight))
		// 开启分页设置
		scrollView.isPagingEnabled = true
		// 设置滚动视图的contentSize为滚动视图的宽度*5，因为有5张图片
		scrollView.contentSize = CGSize(width: GLOBLE_BOUNDS_WIDTH()
			* CGFloat(imageCount), height: scrollViewHeight)
		// 设置代理
		scrollView.delegate = self
		// 当前视图控制器添加滚动视图
		self.view.addSubview(scrollView)
		// 添加图片: img1.png、img2.png...img5.png这5张滚动的广告图片
		for i in 0 ..< imageCount {
			let path = FKSHOP_IMAGES + "img" + String(i + 1) + ".png"
			let image = FKNetworkingUtil.getImageWithURLPath(path)
			let imageView = UIImageView(image:image)
			// 设置UIImageView的大小和位置
			imageView.frame = CGRect(x: GLOBLE_BOUNDS_WIDTH() * CGFloat(i),
				y: 0, width: GLOBLE_BOUNDS_WIDTH(), height: scrollView.frame.size.height)
			// 滚动视图添加UIImageView
			scrollView.addSubview(imageView)
		}
		// 创建分页控件
		pageControl = UIPageControl()
		// 设置选中页的圆点颜色
		pageControl.currentPageIndicatorTintColor = UIColor.red
		// 设置非选中页的圆点颜色
		pageControl.pageIndicatorTintColor = UIColor.gray
		// 一共显示多少页（圆点）
		pageControl.numberOfPages = imageCount
		// 设置分页控件的中心点,x轴为滚动视图中心，y轴为滚动视图高度的0.95
		pageControl.center = CGPoint(x: GLOBLE_BOUNDS_WIDTH() * 0.5,
			y: scrollView.frame.size.height * 0.95)
		// 将分页控件添加到视图上
		self.view.addSubview(pageControl)
		/******************界面下方显示热销商品的表格******************/
		// 创建UITableView，其高度为屏幕高度减去上方滚动区高度、导航栏高度和状态栏高度
		tableView = UITableView(frame:CGRect(x: 0, y: scrollViewHeight, width: GLOBLE_BOUNDS_WIDTH(), height: GLOBLE_BOUNDS_HEIGHT()
			- scrollViewHeight - 64 - 20), style:.plain)
		tableView.dataSource = self
		// 设置行高
		tableView.rowHeight = GLOBLE_BOUNDS_HEIGHT() * 0.3
		// 设置分割线
		tableView.separatorStyle = .singleLine
		// tableview隐藏多余的分割线，tableview没有数据的时候不显示线
		tableView.tableFooterView = UIView()
		// 将tableView添加到视图上
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
		/******************获取网络数据******************/
		// 异步请求数据
		FKNetworkingUtil.getArticleData(
			asynchronous: {[unowned self]array in
			// 获取数据
			self.articleArray = array as! [Article]
			// 网络数据加载完成，删除hud控件
			self.hud.removeFromSuperview()
			// 刷新tableView
			self.tableView.reloadData()
			}, url:ARTICLE_ACTION, params:nil)
	}
	// UIScrollView滚动的时候调用
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		// 设置pageControl的当前页，则当前页的圆点颜色会变化
		pageControl.currentPage = Int(scrollView.contentOffset.x /
			scrollView.frame.size.width)
	}
	// 返回指定分区内的表格行数
	func tableView(_ tableView: UITableView,
		numberOfRowsInSection section: Int) -> Int {
		// 热点数据最多只显示6条
		let realCount = hotItemCount < articleArray.count ?
			hotItemCount : articleArray.count
		return realCount == 0 ? 0 : (realCount - 1) / rowCellCount + 1
	}
	// 返回表格内每个单元格的控件
	func tableView(_ tableView: UITableView,
		cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		// 自定义UITableViewCell
		var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
			as! ArticleTypeTableViewCell?
		// 使用自定义单元格
		if cell == nil {
			cell = ArticleTypeTableViewCell(style:.default,
				reuseIdentifier:cellID)
		}
		// 当前行数
		let row = indexPath.row
		// 定义一个Article对象
		var article: Article! = nil
		// 一列放置两个商品，所以循环两次
		for i in 0 ..< rowCellCount {
			// 如果列数量*2+i 大于 数组的长度 - 1 ，说明没有数据了，退出
			// 第一次 0*2+0 > 14 -1
			// 最后一次 7*2+0 > 14 -1
			if row * rowCellCount + i > articleArray.count {
				break
			}
			// 根据行数获得对应的Article对象
			article = articleArray[row * rowCellCount + i]
			// 类型图片
			let imageURL = FKSHOP_IMAGES_ARTICLE + article.image
			let image = FKNetworkingUtil.getImageWithURLPath(imageURL)
			// 点击的手势处理器，点击时调用cellViewTapped方法
			let recognizer = UITapGestureRecognizer(target:self,
				action:#selector(cellViewTapped(_:)))
			// i == 0 放置在列的第一个视图，否则放第二个视图
			if i == 0 {
				cell!.view1.imageView.image = image
				cell!.view1.nameLabel.text = article.title
				cell!.view1.article = article
				// 为表格行内包含的视图添加手势处理器。
				// 添加手势处理器之后表格不会再响应“表格行被选中”的事件
				cell!.view1.addGestureRecognizer(recognizer)
			}else{
				cell!.view2.imageView.image = image
				cell!.view2.nameLabel.text = article.title
				cell!.view2.article = article
				cell!.view2.addGestureRecognizer(recognizer)
			}
		}
		return cell!
	}
	// 手势点击时的处理方法
	func cellViewTapped(_ recognizer: UITapGestureRecognizer){
		// 获得点击的视图
		let view = recognizer.view as! ArticleTypeView
		// 创建商品详情视图
		let detailViewController = DetailViewController()
		// 将点击选中的商品code传递给类型视图控制器
		detailViewController.article = view.article
		// 显示商品详情的视图
		self.navigationController!.pushViewController(detailViewController,
			animated:true)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}
