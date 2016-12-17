//
//  OrderViewController.swift
//  FKShop
//
//  Created by yeeku on 16/6/16.
//  Copyright © 2016年 org.crazyit. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController, UITableViewDataSource, UITextFieldDelegate {
	var shopCar: [NSData]! // 购物车
	var sumPrice: Double = 0 // 总金额
	var body: String!	// 所有商品的汇总信息
	var sumPriceLabel: UILabel!
	var tableView: UITableView!
	var tfName: UITextField! // 输入收件人姓名的文本框
	var tfAddress: UITextView! // 输入收件人地址的文本框
	var btnBuy: UIButton! // 支付按钮
	var orderSize:CGFloat = 18
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = UIColor.whiteColor()
		self.navigationItem.titleView = FKUtils.getCustomLaber("确认订单")
		// 对于iPhone 6s plus
		if GLOBLE_BOUNDS_WIDTH() == 414 && GLOBLE_BOUNDS_HEIGHT() == 736 {
			orderSize = 20
			// 对于iPhone 6s
		}else if GLOBLE_BOUNDS_WIDTH() == 375 && GLOBLE_BOUNDS_HEIGHT() == 667 {
			orderSize = 18
			// 对于iPhone 5s
		}else if GLOBLE_BOUNDS_WIDTH() == 320 && GLOBLE_BOUNDS_HEIGHT() == 568 {
			orderSize = 16
			// 对于iPhone 4s
		}else{
			orderSize = 14
		}
		// 创建并添加显示收件人标签的UILabel控件
		let nameLabel = UILabel(frame:CGRectMake(GLOBLE_BOUNDS_WIDTH() * 0.1,GLOBLE_BOUNDS_HEIGHT() * 0.03, 100, 20))
		// 设置字体
		nameLabel.font = UIFont.systemFontOfSize(orderSize)
		// 设置居左对齐
		nameLabel.textAlignment = .Left
		nameLabel.text = "收件人："
		self.view.addSubview(nameLabel)
		// 创建并添加显示收件人信息的UITextField控件
		tfName = UITextField(frame:CGRectMake(
			GLOBLE_BOUNDS_WIDTH() * 0.35, GLOBLE_BOUNDS_HEIGHT() * 0.03,
			GLOBLE_BOUNDS_WIDTH() * 0.5 , GLOBLE_BOUNDS_HEIGHT() * 0.04))
		// 设置圆角边框
		tfName.borderStyle = .RoundedRect
		// 设置return按钮类型
		tfName.returnKeyType = .Done
		// 设置文字居中对齐
		tfName.textAlignment = .Center
		tfName.delegate = self
		tfName.font = UIFont.systemFontOfSize(orderSize - 4)
		tfName.text = "黄勇"
		// 添加边框和并设置边框颜色
		tfName.layer.borderWidth = 1
		tfName.layer.borderColor = UIColor.grayColor().CGColor
		self.view.addSubview(tfName)
		// 创建并添加显示收件地址标签的UILabel控件
		let addressLabel = UILabel(frame:CGRectMake(
			GLOBLE_BOUNDS_WIDTH() * 0.1,GLOBLE_BOUNDS_HEIGHT() * 0.1, 100, 20))
		// 设置字体
		addressLabel.font = UIFont.systemFontOfSize(orderSize)
		// 设置居左对齐
		addressLabel.textAlignment = .Left
		addressLabel.text = "收件地址："
		self.view.addSubview(addressLabel)
		// 创建并添加显示收件地址的UITextView控件
		tfAddress = UITextView(frame:CGRectMake(
			GLOBLE_BOUNDS_WIDTH() * 0.35, GLOBLE_BOUNDS_HEIGHT() * 0.1 - 5,
			GLOBLE_BOUNDS_WIDTH() * 0.5, GLOBLE_BOUNDS_WIDTH() * 0.12))
		tfAddress.font = UIFont.systemFontOfSize(orderSize - 4)
		// 设置默认显示的内容
		tfAddress.text = "广州市天河区车陂大岗路沣宏大厦3011"
		//是否可以拖动
		tfAddress.scrollEnabled = true
		//设置是否允许开启滚动
		tfAddress.scrollEnabled = true
		//开启是否显示边界
		tfAddress.showsHorizontalScrollIndicator = true
		//设置超出边界到时候是否有弹簧效果(默认YES)
		tfAddress.bounces = true
		// 添加边框和并设置边框颜色
		tfAddress.layer.borderWidth = 1
		tfAddress.layer.borderColor = UIColor.grayColor().CGColor
		// 添加到当前view
		self.view.addSubview(tfAddress)
		// 创建并添加显示“配送方式”标签的UILabel控件
		let deliveryLabel = UILabel(frame:CGRectMake(
			GLOBLE_BOUNDS_WIDTH() * 0.1, GLOBLE_BOUNDS_HEIGHT() * 0.17, 100, 20))
		// 设置字体
		deliveryLabel.font = UIFont.systemFontOfSize(orderSize)
		// 设置居左对齐
		deliveryLabel.textAlignment = .Left
		deliveryLabel.text = "配送方式"
		self.view.addSubview(deliveryLabel)
		// 创建并添加显示配送方式的UILabel控件
		let timeLabel = UILabel(frame:CGRectMake(
			GLOBLE_BOUNDS_WIDTH() * 0.35, GLOBLE_BOUNDS_HEIGHT() * 0.17,
			GLOBLE_BOUNDS_WIDTH() * 0.60, 20))
		// 设置字体
		timeLabel.font = UIFont.systemFontOfSize(orderSize)
		// 设置居左对齐
		timeLabel.textAlignment = .Left
		// 设置内容
		timeLabel.text = "顺丰快递（24小时发货）"
		// 添加标签
		self.view.addSubview(timeLabel)
		// 创建并添加显示“支付方式”标签的UILabel控件
		let payLabel = UILabel(frame:CGRectMake(
			GLOBLE_BOUNDS_WIDTH() * 0.1, GLOBLE_BOUNDS_HEIGHT() * 0.24, 100, 20))
		// 设置字体
		payLabel.font = UIFont.systemFontOfSize(orderSize)
		// 设置居左对齐
		payLabel.textAlignment = .Left
		payLabel.text = "支付方式"
		self.view.addSubview(payLabel)
		// 创建并添加显示支付方式的UITextField控件
		let textField = UITextField(frame:CGRectMake(
			GLOBLE_BOUNDS_WIDTH() * 0.35, GLOBLE_BOUNDS_HEIGHT() * 0.23,
			GLOBLE_BOUNDS_WIDTH() * 0.3, GLOBLE_BOUNDS_HEIGHT() * 0.04))
		textField.font = UIFont.systemFontOfSize(orderSize - 4)
		textField.borderStyle = .RoundedRect
		textField.text = "微信支付"
		textField.userInteractionEnabled = false
		self.view.addSubview(textField)
		// 创建并添加显示“商品列表”标签的UILabel控件
		let spLabel = UILabel(frame:CGRectMake(GLOBLE_BOUNDS_WIDTH() * 0.1,
			GLOBLE_BOUNDS_HEIGHT() * 0.31, 100, 20))
		// 设置字体
		spLabel.font = UIFont.systemFontOfSize(orderSize)
		// 设置居左对齐
		spLabel.textAlignment = .Left
		spLabel.text = "商品列表"
		self.view.addSubview(spLabel)
		// 创建并添加显示商品列表的UITableView
		tableView = UITableView(frame:CGRectMake(0,
			GLOBLE_BOUNDS_HEIGHT() * 0.35, GLOBLE_BOUNDS_WIDTH(),
			GLOBLE_BOUNDS_HEIGHT() - GLOBLE_BOUNDS_HEIGHT() * 0.55),
			style:.Plain)
		// 设置分隔线
		tableView.separatorStyle = .SingleLine
		// 设置UITableView隐藏多余的分割线，UITableView没有数据的时候不显示额外的分隔线
		tableView.tableFooterView = UIView()
		tableView.dataSource = self
		// 设置行高，和自定义列中的视图一致
		tableView.rowHeight = GLOBLE_BOUNDS_HEIGHT() * 0.2
		self.view.addSubview(tableView)
		// 创建、并添加显示合计信息的UILabel控件
		sumPriceLabel = UILabel(frame:CGRectMake(40,
			GLOBLE_BOUNDS_HEIGHT() * 0.81, 250, 30))
		// 背景颜色
		sumPriceLabel.backgroundColor = UIColor.clearColor()
		// 设置字体和颜色
		sumPriceLabel.font = UIFont.systemFontOfSize(orderSize)
		sumPriceLabel.textColor = UIColor.redColor()
		// 设置居左对齐
		sumPriceLabel.textAlignment = .Left
		sumPriceLabel.text = NSString(format:"合计：￥%.2lf", sumPrice) as String
		self.view.addSubview(sumPriceLabel)
		// 创建并添加“支付”按钮
		btnBuy = UIButton(type:.System)
		// 设置按钮位置和大小
		btnBuy.frame = CGRectMake(GLOBLE_BOUNDS_WIDTH() * 0.7,
			GLOBLE_BOUNDS_HEIGHT() * 0.81, GLOBLE_BOUNDS_WIDTH() * 0.25,
			GLOBLE_BOUNDS_HEIGHT() * 0.06)
		// 设置背景图片（使用美工提供的按钮图片）
		btnBuy.setBackgroundImage(UIImage(named:JIESUANPNG), forState:.Normal)
		btnBuy.setBackgroundImage(UIImage(named:JIESUANNOPNG), forState: .Disabled)
		btnBuy.addTarget(self, action:#selector(onPay(_:)),
			forControlEvents:.TouchUpInside)
		self.view.addSubview(btnBuy)
		self.view.addGestureRecognizer(UITapGestureRecognizer(target:self,
			action:#selector(viewTapped(_:))))
	}
	func viewTapped(recognizer: UITapGestureRecognizer){
		tfName.resignFirstResponder()
		tfAddress.resignFirstResponder()
	}
	override func viewWillAppear(animated: Bool){
		super.viewWillAppear(animated)
		sumPrice = 0
		// 获取购物车数据
		let userDefaults = NSUserDefaults.standardUserDefaults()
		let dict = userDefaults.objectForKey(SHOP_CAR)
		shopCar = dict!.allValues as! [NSData]
		body = ""
		// 遍历购物车
		for data in shopCar {
			// 恢复Article对象
			let article = NSKeyedUnarchiver.unarchiveObjectWithData(data)
				as! Article
			// 合并所有商品的名称
			if body == "" {
				body = article.title
			}else{
				body = body + ", " + article.title
			}
			let price = article.price.doubleValue // 获取商品的价格
			let buyNum = (article.buyNum as NSString).intValue // 获取商品的购买数量
			sumPrice = sumPrice + price * Double(buyNum)
		}
		// 有商品时，支付按钮才可用
		btnBuy.enabled = sumPrice > 0
		sumPriceLabel.text = NSString(format:"合计：￥%.2lf", sumPrice) as String
		tableView.reloadData()
	}
				
	// 返回指定分区内包含的表格行的数量（shopCar内有几条数据，就包含几个表格行）
	func tableView(tableView: UITableView, numberOfRowsInSection
		section: Int) -> Int {
		return shopCar.count
	}
	// 返回表格内每个单元格的控件
	func tableView(tableView: UITableView, cellForRowAtIndexPath
		indexPath: NSIndexPath) -> UITableViewCell {
		var cell = tableView.dequeueReusableCellWithIdentifier(cellID)
			as! ShopCarTableViewCell?
		// 如果从“可重用单元格队列”中取出的UITableViewCell为空，则创建一个，并指定重用标识符
		if cell == nil {
			cell = ShopCarTableViewCell(style:.Default, reuseIdentifier:cellID)
		}
		// 物品类型对象
		let data = shopCar[indexPath.row]
		let article = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! Article
		// 网络读取图片数据
		let imageURL = FKSHOP_IMAGES_ARTICLE + article.image
		let image = FKNetworkingUtil.getImageWithURLPath(imageURL)
		// 商品图片
		cell!.articleImageView.image = image
		// 商品描述
		cell!.titleLabel.text = article.title
		// 供应商信息
		cell!.supplierLabel.text = article.supplier
		// 商品价格
		cell!.priceLabel.text = NSString(format:"￥%.2lf", article.price.doubleValue) as String
		// 购买数量
		cell!.buyNumLabel.text = "×" + article.buyNum
		return cell!
	}
	// “支付”按钮的事件处理方法
	func onPay(sender: AnyObject)  {
		// 提交数据到后台（金额，商品描述，终端IP）
		let ipAddress = FKUtils.getCurrentIPAddress()
		NSLog("body = %@" , body)
		NSLog("sumPrice = %g" , sumPrice)
		NSLog("ipAddress = %@" , ipAddress)
		NSLog("========开始支付流程========");
		// 定义后台应用中统一下单的URL字符串
		let urlString = CONTEXT_ROOT + "/app/pay.action"
		// 创建发送请求的的NSMutableURLRequest对象
		let request = NSMutableURLRequest(URL:(NSURL(string:urlString))!)
		request.HTTPMethod = "POST"
		let parameter = "bodyValue=" + body + "&total_fee=\(sumPrice)"
			+ "&spbill_create_ip=" + ipAddress
		// 为NSMutableURLRequest指定请求参数
		request.HTTPBody = parameter.dataUsingEncoding(NSUTF8StringEncoding)
		// ①、向后台应用发送统一下单的POST请求
		let task = NSURLSession.sharedSession().dataTaskWithRequest(request,
			completionHandler: {data, response, error in
			if data != nil {
				// 使用JSON解析来解析服务器响应
				let dict = try? NSJSONSerialization.JSONObjectWithData(data!,
					options:.MutableLeaves)
				print("请求返回字典: \(dict)")
				if dict != nil {
					let retcode = dict!["retcode"] as! NSString
					if retcode.intValue == 0 {
						let stamp = dict!["timestamp"]
						// ②、发起微信支付
						let req = PayReq()
						req.partnerId = dict!["partnerid"] as! String
						req.prepayId = dict!["prepayid"] as! String
						req.nonceStr = dict!["noncestr"] as! String
						req.timeStamp = UInt32((stamp as! NSString).intValue)
						req.package = dict!["package"] as! String
						/********生成签名（详见微信文档的签名生成算法）************************/
						let stringSign = "appid=" + (dict!["appid"] as! String) + "&noncestr="
							+ req.nonceStr + "&package=" + req.package + "&partnerid=" + req.partnerId
							+ "&prepayid=" + req.prepayId + "&timestamp=" + (stamp as! String)
						// 此处key参数的值要与服务端FKCommonUtil.java中key保持一致
						let stringSignTemp = stringSign + "&key=fkjava36750064247ec02edce69f6a2d"
						print("stringSignTemp: \(stringSignTemp)")
						// 对stringSignTemp字符串进行MD5加密
						let sign = stringSignTemp.md5().uppercaseString
						req.sign = sign;
						// 发送支付请求
						WXApi.sendReq(req)
					}
				}
			}
		})
		task.resume()
	}
	// 用户支付成功后的处理方法
	func onPaySuccess(){
		btnBuy.enabled = false // 支付完成，取消支付按钮的可用状态
		let userDefaults = NSUserDefaults.standardUserDefaults()
		// 清空购物车
		userDefaults.setObject(nil, forKey:SHOP_CAR)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}
