//
//  OrderViewController.swift
//  FKShop
//
//  Created by yeeku on 16/6/16.
//  Copyright © 2016年 org.crazyit. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController, UITableViewDataSource, UITextFieldDelegate {
	var shopCar: [Data]! // 购物车
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
		self.view.backgroundColor = UIColor.white
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
		let nameLabel = UILabel(frame:CGRect(x: GLOBLE_BOUNDS_WIDTH() * 0.1,y: GLOBLE_BOUNDS_HEIGHT() * 0.03, width: 100, height: 20))
		// 设置字体
		nameLabel.font = UIFont.systemFont(ofSize: orderSize)
		// 设置居左对齐
		nameLabel.textAlignment = .left
		nameLabel.text = "收件人："
		self.view.addSubview(nameLabel)
		// 创建并添加显示收件人信息的UITextField控件
		tfName = UITextField(frame:CGRect(
			x: GLOBLE_BOUNDS_WIDTH() * 0.35, y: GLOBLE_BOUNDS_HEIGHT() * 0.03,
			width: GLOBLE_BOUNDS_WIDTH() * 0.5 , height: GLOBLE_BOUNDS_HEIGHT() * 0.04))
		// 设置圆角边框
		tfName.borderStyle = .roundedRect
		// 设置return按钮类型
		tfName.returnKeyType = .done
		// 设置文字居中对齐
		tfName.textAlignment = .center
		tfName.delegate = self
		tfName.font = UIFont.systemFont(ofSize: orderSize - 4)
		tfName.text = "黄勇"
		// 添加边框和并设置边框颜色
		tfName.layer.borderWidth = 1
		tfName.layer.borderColor = UIColor.gray.cgColor
		self.view.addSubview(tfName)
		// 创建并添加显示收件地址标签的UILabel控件
		let addressLabel = UILabel(frame:CGRect(
			x: GLOBLE_BOUNDS_WIDTH() * 0.1,y: GLOBLE_BOUNDS_HEIGHT() * 0.1, width: 100, height: 20))
		// 设置字体
		addressLabel.font = UIFont.systemFont(ofSize: orderSize)
		// 设置居左对齐
		addressLabel.textAlignment = .left
		addressLabel.text = "收件地址："
		self.view.addSubview(addressLabel)
		// 创建并添加显示收件地址的UITextView控件
		tfAddress = UITextView(frame:CGRect(
			x: GLOBLE_BOUNDS_WIDTH() * 0.35, y: GLOBLE_BOUNDS_HEIGHT() * 0.1 - 5,
			width: GLOBLE_BOUNDS_WIDTH() * 0.5, height: GLOBLE_BOUNDS_WIDTH() * 0.12))
		tfAddress.font = UIFont.systemFont(ofSize: orderSize - 4)
		// 设置默认显示的内容
		tfAddress.text = "广州市天河区车陂大岗路沣宏大厦3011"
		//是否可以拖动
		tfAddress.isScrollEnabled = true
		//设置是否允许开启滚动
		tfAddress.isScrollEnabled = true
		//开启是否显示边界
		tfAddress.showsHorizontalScrollIndicator = true
		//设置超出边界到时候是否有弹簧效果(默认YES)
		tfAddress.bounces = true
		// 添加边框和并设置边框颜色
		tfAddress.layer.borderWidth = 1
		tfAddress.layer.borderColor = UIColor.gray.cgColor
		// 添加到当前view
		self.view.addSubview(tfAddress)
		// 创建并添加显示“配送方式”标签的UILabel控件
		let deliveryLabel = UILabel(frame:CGRect(
			x: GLOBLE_BOUNDS_WIDTH() * 0.1, y: GLOBLE_BOUNDS_HEIGHT() * 0.17, width: 100, height: 20))
		// 设置字体
		deliveryLabel.font = UIFont.systemFont(ofSize: orderSize)
		// 设置居左对齐
		deliveryLabel.textAlignment = .left
		deliveryLabel.text = "配送方式"
		self.view.addSubview(deliveryLabel)
		// 创建并添加显示配送方式的UILabel控件
		let timeLabel = UILabel(frame:CGRect(
			x: GLOBLE_BOUNDS_WIDTH() * 0.35, y: GLOBLE_BOUNDS_HEIGHT() * 0.17,
			width: GLOBLE_BOUNDS_WIDTH() * 0.60, height: 20))
		// 设置字体
		timeLabel.font = UIFont.systemFont(ofSize: orderSize)
		// 设置居左对齐
		timeLabel.textAlignment = .left
		// 设置内容
		timeLabel.text = "顺丰快递（24小时发货）"
		// 添加标签
		self.view.addSubview(timeLabel)
		// 创建并添加显示“支付方式”标签的UILabel控件
		let payLabel = UILabel(frame:CGRect(
			x: GLOBLE_BOUNDS_WIDTH() * 0.1, y: GLOBLE_BOUNDS_HEIGHT() * 0.24, width: 100, height: 20))
		// 设置字体
		payLabel.font = UIFont.systemFont(ofSize: orderSize)
		// 设置居左对齐
		payLabel.textAlignment = .left
		payLabel.text = "支付方式"
		self.view.addSubview(payLabel)
		// 创建并添加显示支付方式的UITextField控件
		let textField = UITextField(frame:CGRect(
			x: GLOBLE_BOUNDS_WIDTH() * 0.35, y: GLOBLE_BOUNDS_HEIGHT() * 0.23,
			width: GLOBLE_BOUNDS_WIDTH() * 0.3, height: GLOBLE_BOUNDS_HEIGHT() * 0.04))
		textField.font = UIFont.systemFont(ofSize: orderSize - 4)
		textField.borderStyle = .roundedRect
		textField.text = "微信支付"
		textField.isUserInteractionEnabled = false
		self.view.addSubview(textField)
		// 创建并添加显示“商品列表”标签的UILabel控件
		let spLabel = UILabel(frame:CGRect(x: GLOBLE_BOUNDS_WIDTH() * 0.1,
			y: GLOBLE_BOUNDS_HEIGHT() * 0.31, width: 100, height: 20))
		// 设置字体
		spLabel.font = UIFont.systemFont(ofSize: orderSize)
		// 设置居左对齐
		spLabel.textAlignment = .left
		spLabel.text = "商品列表"
		self.view.addSubview(spLabel)
		// 创建并添加显示商品列表的UITableView
		tableView = UITableView(frame:CGRect(x: 0,
			y: GLOBLE_BOUNDS_HEIGHT() * 0.35, width: GLOBLE_BOUNDS_WIDTH(),
			height: GLOBLE_BOUNDS_HEIGHT() - GLOBLE_BOUNDS_HEIGHT() * 0.55),
			style:.plain)
		// 设置分隔线
		tableView.separatorStyle = .singleLine
		// 设置UITableView隐藏多余的分割线，UITableView没有数据的时候不显示额外的分隔线
		tableView.tableFooterView = UIView()
		tableView.dataSource = self
		// 设置行高，和自定义列中的视图一致
		tableView.rowHeight = GLOBLE_BOUNDS_HEIGHT() * 0.2
		self.view.addSubview(tableView)
		// 创建、并添加显示合计信息的UILabel控件
		sumPriceLabel = UILabel(frame:CGRect(x: 40,
			y: GLOBLE_BOUNDS_HEIGHT() * 0.81, width: 250, height: 30))
		// 背景颜色
		sumPriceLabel.backgroundColor = UIColor.clear
		// 设置字体和颜色
		sumPriceLabel.font = UIFont.systemFont(ofSize: orderSize)
		sumPriceLabel.textColor = UIColor.red
		// 设置居左对齐
		sumPriceLabel.textAlignment = .left
		sumPriceLabel.text = NSString(format:"合计：￥%.2lf", sumPrice) as String
		self.view.addSubview(sumPriceLabel)
		// 创建并添加“支付”按钮
		btnBuy = UIButton(type:.system)
		// 设置按钮位置和大小
		btnBuy.frame = CGRect(x: GLOBLE_BOUNDS_WIDTH() * 0.7,
			y: GLOBLE_BOUNDS_HEIGHT() * 0.81, width: GLOBLE_BOUNDS_WIDTH() * 0.25,
			height: GLOBLE_BOUNDS_HEIGHT() * 0.06)
		// 设置背景图片（使用美工提供的按钮图片）
		btnBuy.setBackgroundImage(UIImage(named:JIESUANPNG), for:UIControlState())
		btnBuy.setBackgroundImage(UIImage(named:JIESUANNOPNG), for: .disabled)
		btnBuy.addTarget(self, action:#selector(onPay(_:)),
			for:.touchUpInside)
		self.view.addSubview(btnBuy)
		self.view.addGestureRecognizer(UITapGestureRecognizer(target:self,
			action:#selector(viewTapped(_:))))
	}
	func viewTapped(_ recognizer: UITapGestureRecognizer){
		tfName.resignFirstResponder()
		tfAddress.resignFirstResponder()
	}
	override func viewWillAppear(_ animated: Bool){
		super.viewWillAppear(animated)
		sumPrice = 0
		// 获取购物车数据
		let userDefaults = UserDefaults.standard
		let dict = userDefaults.object(forKey: SHOP_CAR)
		shopCar = (dict! as AnyObject).allValues as! [Data]
		body = ""
		// 遍历购物车
		for data in shopCar {
			// 恢复Article对象
			let article = NSKeyedUnarchiver.unarchiveObject(with: data)
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
		btnBuy.isEnabled = sumPrice > 0
		sumPriceLabel.text = NSString(format:"合计：￥%.2lf", sumPrice) as String
		tableView.reloadData()
	}
				
	// 返回指定分区内包含的表格行的数量（shopCar内有几条数据，就包含几个表格行）
	func tableView(_ tableView: UITableView, numberOfRowsInSection
		section: Int) -> Int {
		return shopCar.count
	}
	// 返回表格内每个单元格的控件
	func tableView(_ tableView: UITableView, cellForRowAt
		indexPath: IndexPath) -> UITableViewCell {
		var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
			as! ShopCarTableViewCell?
		// 如果从“可重用单元格队列”中取出的UITableViewCell为空，则创建一个，并指定重用标识符
		if cell == nil {
			cell = ShopCarTableViewCell(style:.default, reuseIdentifier:cellID)
		}
		// 物品类型对象
		let data = shopCar[indexPath.row]
		let article = NSKeyedUnarchiver.unarchiveObject(with: data) as! Article
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
	func onPay(_ sender: AnyObject)  {
		// 提交数据到后台（金额，商品描述，终端IP）
		let ipAddress = FKUtils.getCurrentIPAddress()
		NSLog("body = %@" , body)
		NSLog("sumPrice = %g" , sumPrice)
		NSLog("ipAddress = \(ipAddress)")
		NSLog("========开始支付流程========");
		// 定义后台应用中统一下单的URL字符串
		let urlString = CONTEXT_ROOT + "/app/pay.action"
		// 创建发送请求的的NSMutableURLRequest对象
		let request = NSMutableURLRequest(url:(URL(string:urlString))!)
		request.httpMethod = "POST"
		let parameter = "bodyValue=" + body + "&total_fee=\(sumPrice)"
			+ "&spbill_create_ip=" + ipAddress!
		// 为NSMutableURLRequest指定请求参数
		request.httpBody = parameter.data(using: String.Encoding.utf8)
		// ①、向后台应用发送统一下单的POST请求
/*
		let task = URLSession.shared.dataTask(with: request,
			completionHandler: {data, response, error in
			if data != nil {
				// 使用JSON解析来解析服务器响应
				let dict = try? JSONSerialization.jsonObject(with: data!,
					options:.mutableLeaves)
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
						let sign = stringSignTemp.md5().uppercased()
						req.sign = sign;
						// 发送支付请求
						WXApi.send(req)
					}
				}
			}
		})
		task.resume()
*/
	}
	// 用户支付成功后的处理方法
	func onPaySuccess(){
		btnBuy.isEnabled = false // 支付完成，取消支付按钮的可用状态
		let userDefaults = UserDefaults.standard
		// 清空购物车
		userDefaults.set(nil, forKey:SHOP_CAR)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}
