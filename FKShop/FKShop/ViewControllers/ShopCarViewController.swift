//
//  ShopCarViewController.swift
//  FKShop
//
//  Created by yeeku on 16/6/16.
//  Copyright © 2016年 org.crazyit. All rights reserved.
//

import UIKit

class ShopCarViewController: UIViewController,UITableViewDataSource{
	var shopCar = [NSData]() // 购物车
	var sumPrice: Double = 0
	var sumPriceLabel: UILabel!
	var tableView: UITableView!
	var btnBuy: UIButton! // 结算订单的按钮
	required init?(coder aDecoder: NSCoder) {
		super.init(coder:aDecoder)
		let unselectImage = UIImage(named: SHOPCARNMPNG)
		let selectImage = UIImage(named: SHOPCARONPNG)
		let item = UITabBarItem(title:"购物车", image:unselectImage!
			.imageWithRenderingMode(.AlwaysOriginal),
			selectedImage:selectImage!.imageWithRenderingMode(.AlwaysOriginal))
		item.tag = 2
		self.tabBarItem = item
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = UIColor.whiteColor()
		// 创建和添加显示“我的购物车”的UILabel控件
		let titleLabel = UILabel(frame:
			CGRectMake(0, 0, GLOBLE_BOUNDS_WIDTH(), 30))
		// 设置背景色
		titleLabel.backgroundColor = UIColor.grayColor()
		// 设置字体
		titleLabel.font = UIFont.systemFontOfSize(20)
		titleLabel.textAlignment = .Left
		titleLabel.text = "我的购物车"
		// 添加边框和并设置边框颜色
		titleLabel.layer.borderWidth = 1
		titleLabel.layer.borderColor = UIColor.grayColor().CGColor
		self.view.addSubview(titleLabel)
		// 创建和添加显示合计信息的UILabel控件
		sumPriceLabel = UILabel(frame:CGRectMake(40, 42, 250, 25))
		// 设置背景色
		sumPriceLabel.backgroundColor = UIColor.clearColor()
		// 设置字体和颜色
		sumPriceLabel.font = UIFont.systemFontOfSize(22)
		sumPriceLabel.textColor = UIColor.redColor()
		// 设置居左对齐
		sumPriceLabel.textAlignment = .Left
		sumPriceLabel.text = NSString(format:"合计：￥%.2lf",
			sumPrice) as String
		self.view.addSubview(sumPriceLabel)
		// 创建和添加“结算”的按钮
		btnBuy = UIButton(type:.System)
		// 设置大小和位置位置
		btnBuy.frame = CGRectMake(GLOBLE_BOUNDS_WIDTH() * 0.7, 38,
			GLOBLE_BOUNDS_WIDTH() * 0.23, GLOBLE_BOUNDS_HEIGHT() * 0.05)
		let submitImage = UIImage(named: SUBMITPNG)
		// 设置图片背景（使用美工提供的按钮图片）
		btnBuy.setBackgroundImage(submitImage, forState:.Normal)
		btnBuy.addTarget(self, action:#selector(onAddOrder(_:)), forControlEvents:.TouchUpInside)
		self.view.addSubview(btnBuy)
		// 创建UITableView
		tableView = UITableView(frame:CGRectMake(10, 80,
			GLOBLE_BOUNDS_WIDTH() - 20, GLOBLE_BOUNDS_HEIGHT() - 168),
			style:.Plain)
		// 设置分割线
		tableView.separatorStyle = .SingleLine
		// 设置表格隐藏多余的分割线，表格没有数据的时候不显示线
		tableView.tableFooterView = UIView()
		tableView.dataSource = self
		// 设置行高，和自定义表格行的高度保持一致
		tableView.rowHeight = GLOBLE_BOUNDS_HEIGHT() * 0.18
		self.view.addSubview(tableView)
	}
		
	override func viewWillAppear(animated: Bool){
		super.viewWillAppear(animated)
		// 购物车数据
		let userDefaults = NSUserDefaults.standardUserDefaults()
		let dict = userDefaults.objectForKey(SHOP_CAR)
		if dict == nil {
			btnBuy.enabled = false
			return
		}
		shopCar = dict!.allValues as! [NSData]
		// 合计
		sumPrice = 0
		// 遍历购物车
		for data in shopCar {
			// 恢复数据
			let article = NSKeyedUnarchiver.unarchiveObjectWithData(data)
				as! Article
			let price = article.price.doubleValue // 获取商品的价格
			let buyNum = (article.buyNum as NSString).intValue // 获取商品的数量
			sumPrice = sumPrice + price * Double(buyNum)
		}
		btnBuy.enabled = sumPrice > 0
		sumPriceLabel.text = NSString(format:"合计：￥%.2lf", sumPrice)
			as String
		tableView.reloadData()
	}
	// 返回各分区内包含的表格行的数量（shopcar数组有多少个元素，就显示多少个表格行）
	func tableView(tableView: UITableView, numberOfRowsInSection
		section: Int) -> Int {
		return shopCar.count
	}
	
	// 返回表格内每个单元格的控件
	func tableView(tableView: UITableView, cellForRowAtIndexPath
		indexPath: NSIndexPath) -> UITableViewCell {
		// 根据重用标示符从UITableView管理的“可重用单元格队列”中取出一个UITableViewCell对象
		var cell = tableView.dequeueReusableCellWithIdentifier(cellID)
			as! ShopCarTableViewCell?
		// 如果取出的UITableViewCell对象为空，则创建一个，并指定重用标示符
		if cell == nil {
			cell = ShopCarTableViewCell(style:.Default, reuseIdentifier:cellID)
		}
		let data = shopCar[indexPath.row]
		// 恢复商品对象
		let article = NSKeyedUnarchiver.unarchiveObjectWithData(data)
			as! Article
		// 网络读取图片数据
		let imageURL = FKSHOP_IMAGES_ARTICLE + article.image
		let image = FKNetworkingUtil.getImageWithURLPath(imageURL)
		cell!.articleImageView.image = image
		cell!.titleLabel.text = article.title
		cell!.supplierLabel.text = article.supplier
		cell!.priceLabel.text = NSString(format:"￥%.2lf",
			article.price.doubleValue) as String
		cell!.buyNumLabel.text = "×" + article.buyNum
		return cell!
	}
	// 为“提交”按钮添加事件处理方法
	func onAddOrder(sender: AnyObject) {
		// 创建订单详情视图控制器
		let orderViewController = OrderViewController()
		// 显示订单详情的视图控制器
		self.navigationController!.pushViewController(orderViewController, animated:true)
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}
