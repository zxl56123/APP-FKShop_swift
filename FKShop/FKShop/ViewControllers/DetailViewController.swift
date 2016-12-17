//
//  DetailViewController.swift
//  FKShop
//
//  Created by yeeku on 16/6/16.
//  Copyright © 2016年 org.crazyit. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
	var article: Article!
	var textField: UITextField! // 输入的购买数量的文本框
	var shopCar: [String: Data]! // 购物车
	var imageView: UIImageView!
	var titleLabel: UILabel!
	var priceLabel: UILabel!
	var descriptionLabel: UILabel!
	override func viewDidLoad() {
		super.viewDidLoad()
		var detailSize: CGFloat = 12
		// 对于iPhone 6s Plus
		if GLOBLE_BOUNDS_WIDTH() == 414 && GLOBLE_BOUNDS_HEIGHT() == 736{
			detailSize = 17
			// 对于iPhone 6s
		}else if GLOBLE_BOUNDS_WIDTH() == 375 && GLOBLE_BOUNDS_HEIGHT() == 667{
			detailSize = 15
			// 对于iPhone 5s
		}else if GLOBLE_BOUNDS_WIDTH() == 320 && GLOBLE_BOUNDS_HEIGHT() == 568{
			// 对于iPhone4s
			detailSize = 13
		}else{
			detailSize = 12
		}
		self.view.backgroundColor = UIColor.white
		self.navigationItem.titleView = FKUtils.getCustomLaber("宝贝详情")
		// 创建、并添加显示商品图片的UIImageView控件
		imageView = UIImageView(frame: CGRect(x: 50, y: 10, width: GLOBLE_BOUNDS_WIDTH() - 100, height: GLOBLE_BOUNDS_HEIGHT() * 0.4))
		imageView.contentMode = .scaleAspectFit
		self.view.addSubview(imageView)
		// 创建、并添加显示商品描述的UILabel控件
		titleLabel = UILabel(frame:CGRect(x: 10 ,
			y: GLOBLE_BOUNDS_HEIGHT() * 0.4, width: GLOBLE_BOUNDS_WIDTH() - 20,
			height: GLOBLE_BOUNDS_HEIGHT() * 0.11))
		// 设置背景色
		titleLabel.backgroundColor = UIColor.clear
		// 设置字体
		titleLabel.font = UIFont.systemFont(ofSize: detailSize)
		// 设置居左对齐
		titleLabel.textAlignment = .left
		// 设置没有行数限制
		titleLabel.numberOfLines = 0
		self.view.addSubview(titleLabel)
		// 创建、并添加显示商品价格的UILabel控件
		priceLabel = UILabel(frame:CGRect(x: 20,
			y: GLOBLE_BOUNDS_HEIGHT() * 0.4 + titleLabel.frame.size.height,
			width: GLOBLE_BOUNDS_WIDTH() - 20, height: GLOBLE_BOUNDS_HEIGHT() * 0.03))
		// 设置背景色
		priceLabel.backgroundColor = UIColor.clear
		// 设置字体和颜色
		priceLabel.font = UIFont.systemFont(ofSize: detailSize)
		priceLabel.textColor = UIColor.red
		priceLabel.textAlignment = .left
		self.view.addSubview(priceLabel)
		// 创建、并添加显示销量信息的UILabel控件
		let contentLabel = UILabel(frame:CGRect(x: 20,
			y: GLOBLE_BOUNDS_HEIGHT() * 0.4 + titleLabel.frame.size.height +
			priceLabel.frame.size.height, width: GLOBLE_BOUNDS_WIDTH() - 20 , height: GLOBLE_BOUNDS_HEIGHT() * 0.02))
		// 设置背景色
		contentLabel.backgroundColor = UIColor.clear
		// 设置字体和颜色
		contentLabel.font = UIFont.systemFont(ofSize: detailSize)
		contentLabel.textColor = UIColor.gray
		contentLabel.textAlignment = .left
		contentLabel.text = "卖家包邮   月销5000笔   广州发货"
		self.view.addSubview(contentLabel)
		// 添加线条分隔条
		let line = LineView(frame:CGRect(x: 10, y: GLOBLE_BOUNDS_HEIGHT() * 0.4
			+ titleLabel.frame.size.height + priceLabel.frame.size.height
			+ contentLabel.frame.size.height, width: GLOBLE_BOUNDS_WIDTH() - 20,
			height: GLOBLE_BOUNDS_HEIGHT() * 0.04))
		self.view.addSubview(line)
		// 创建、并添加显示商品评价的UILabel控件
		let bodyLabel = UILabel(frame:CGRect(x: 20,
			y: GLOBLE_BOUNDS_HEIGHT() * 0.4 + titleLabel.frame.size.height
			+ priceLabel.frame.size.height + contentLabel.frame.size.height
			+ line.frame.size.height, width: GLOBLE_BOUNDS_WIDTH() - 20,
			height: GLOBLE_BOUNDS_HEIGHT() * 0.02))
		// 设置背景色
		bodyLabel.backgroundColor = UIColor.clear
		// 设置字体
		bodyLabel.font = UIFont.systemFont(ofSize: detailSize)
		bodyLabel.textAlignment = .left
		bodyLabel.text = "宝贝评价"
		self.view.addSubview(bodyLabel)
		// 创建、并添加显示评价内容的UILabel控件
		descriptionLabel = UILabel(frame:CGRect(x: 20, y: GLOBLE_BOUNDS_HEIGHT()
			* 0.4 + titleLabel.frame.size.height + priceLabel.frame.size.height
			+ contentLabel.frame.size.height + line.frame.size.height
			+ bodyLabel.frame.size.height, width: GLOBLE_BOUNDS_WIDTH() - 20,
			height: GLOBLE_BOUNDS_HEIGHT() * 0.15))
		// 设置背景色
		descriptionLabel.backgroundColor = UIColor.clear
		// 设置字体
		descriptionLabel.font = UIFont.systemFont(ofSize: detailSize)
		descriptionLabel.numberOfLines = 0
		descriptionLabel.textAlignment = .left
		self.view.addSubview(descriptionLabel)
		// 创建、并添加显示“数量：”的UILabel控件
		let buyNumLabel = UILabel(frame:CGRect(x: 20,
			y: GLOBLE_BOUNDS_HEIGHT() * 0.80, width: GLOBLE_BOUNDS_WIDTH() * 0.25 ,
			height: GLOBLE_BOUNDS_HEIGHT() * 0.04))
		// 设置背景色
		buyNumLabel.backgroundColor = UIColor.clear
		// 设置字体
		buyNumLabel.font = UIFont.systemFont(ofSize: 18)
		buyNumLabel.textAlignment = .left
		buyNumLabel.text = "数量："
		self.view.addSubview(buyNumLabel)
		// 创建、并添加输入购买数量的UITextField控件
		textField = UITextField(frame:CGRect(x: 75,
			y: GLOBLE_BOUNDS_HEIGHT() * 0.80, width: GLOBLE_BOUNDS_WIDTH() * 0.2 ,
			height: GLOBLE_BOUNDS_HEIGHT() * 0.04))
		// 提示信息
		textField.text = "1"
		// 设置圆角边框
		textField.borderStyle = .roundedRect
		textField.keyboardType = .numberPad
		textField.textAlignment = .center
		// 添加边框和设置边框颜色
		textField.layer.borderWidth = 1
		textField.layer.borderColor = UIColor.gray.cgColor
		self.view.addSubview(textField)
		// 创建并添加“添加到购物车“的按钮
		let btnCar = UIButton(type:.system)
		// 设置大小和位置
		btnCar.frame = CGRect(x: GLOBLE_BOUNDS_WIDTH() * 0.44,
			y: GLOBLE_BOUNDS_HEIGHT() * 0.79, width: GLOBLE_BOUNDS_WIDTH() * 0.24,
			height: GLOBLE_BOUNDS_HEIGHT() * 0.06)
		// 获取按钮的图片（使用美工提供的按钮图片）
		let putImage = UIImage(named:PUTINPNG)
		btnCar.setBackgroundImage(putImage, for:UIControlState())
		self.view.addSubview(btnCar)
		// 创建并添加“立即购买”的按钮
		let btnBuy = UIButton(type:.system)
		// 设置大小和位置
		btnBuy.frame = CGRect(x: GLOBLE_BOUNDS_WIDTH() * 0.73,
			y: GLOBLE_BOUNDS_HEIGHT() * 0.79, width: GLOBLE_BOUNDS_WIDTH() * 0.24,
			height: GLOBLE_BOUNDS_HEIGHT() * 0.06)
		// 获取图片名称
		let buyImage = UIImage(named:BUYNOWJPG)
		// 设置图片背景（使用美工提供的按钮图片）
		btnBuy.setBackgroundImage(buyImage, for:UIControlState())
		self.view.addSubview(btnBuy)
		// 为两个按钮添加事件处理方法
		btnCar.addTarget(self, action:#selector(onAddShopcar(_:)),
			for:.touchUpInside)
		btnBuy.addTarget(self, action:#selector(onBuy(_:)),
			for:.touchUpInside)
		self.view.addGestureRecognizer(UITapGestureRecognizer(target:self,
			action:#selector(viewTapped(_:))))
	}  // ①
	func viewTapped(_ recognizer: UITapGestureRecognizer){
		textField.resignFirstResponder()
	}
	
	override func viewWillAppear(_ animated: Bool){
		super.viewWillAppear(animated)
		// 网络读取图片数据
		let imageURL = FKSHOP_IMAGES_ARTICLE + self.article.image
		let image = FKNetworkingUtil.getImageWithURLPath(imageURL)
		// 设置图片控件显示商品的图片
		imageView.image = image
		// 设置显示商品的标题
		titleLabel.text = self.article.title
		// 设置显示商品的价格
		priceLabel.text = NSString(format:"￥%.2lf",
			self.article.price.doubleValue) as String
		// 设置显示商品的描述
		descriptionLabel.text = self.article.descriptions
	}
	
	// 加入购物车的响应事件
	func onAddShopcar(_ sender: AnyObject) {
		// 1.从NSUserDefaults获得购物车
		let userDefaults = UserDefaults.standard
		var dict = userDefaults.value(forKey: SHOP_CAR)
		// 如果购物车为空则创建一个NSMutableDictionary对象
		if dict == nil {
			dict = NSMutableDictionary()
		}
		shopCar = dict as! [String: Data]
		// 判断是否重复购买
		let oldData = shopCar[self.article.id]
		if oldData != nil {
			let oldArticle = NSKeyedUnarchiver.unarchiveObject(with: oldData!)
				as! Article
			 // 之前的购买数量
			let oldBuyNum = (oldArticle.buyNum as NSString).integerValue
			 // 当前的购买数量
			let currBuyNum = (textField.text! as NSString).integerValue
			self.article.buyNum = NSString(format:"%ld", oldBuyNum + currBuyNum)
				as String
		}else{
			// 获得购买的数量
			self.article.buyNum = textField.text
		}
		// 2.需要使用NSKeyedArchiver把数据归档为NSData对象，然后把NSData存储到购物车中
		let data = NSKeyedArchiver.archivedData(withRootObject: self.article)
		shopCar[self.article.id] = data
		// 3.将购物车保存到NSUserDefaults对象
		userDefaults.set(shopCar, forKey:SHOP_CAR)
		// 4.生成提示框
		let alert = UIAlertController(title:"提示", message:"商品添加成功!",
			preferredStyle: .alert)
		// 创建、并添加一个UIAlertAction，该Action有关联的处理行为
		let action = UIAlertAction(title: "确定", style: .destructive,
								   handler: {action in
			// 跳转到购物车视图
			// 获得navigationController的所有子UIViewController
			let viewControllers = self.navigationController!.viewControllers
			for viewController in viewControllers {
				// 判断当前的UIViewController是不是MainViewController类型
				if viewController.isKind(of: MainViewController.self) {
					// 找到上层的MainViewController
					let mainViewController = viewController as! MainViewController
					// 设置选项卡显示第二个item既购物车视图
					mainViewController.selectedIndex = 1
					break
				}
			}
			// pop到RootViewController即MainViewController
			self.navigationController!.popToRootViewController(animated: true)
		})
		alert.addAction(action)
		// 将action对应的按钮设置为“高亮”按钮
		alert.preferredAction = action
		// 显示UIAlertController
		self.present(alert, animated: true, completion: nil)
	}
	// 处理购买事件
	func onBuy(_ sender: AnyObject) {
		let currBuyNum = (textField.text! as NSString).integerValue // 当前的购买数量
		self.article.buyNum = NSString(format:"%ld", currBuyNum) as String
		// 生成新的购物车
		let shopCar = NSMutableDictionary()
		let data = NSKeyedArchiver.archivedData(withRootObject: self.article)
		shopCar[self.article.id] = data
		let userDefaults = UserDefaults.standard
		// 将购物车保存到NSUserDefaults对象
		userDefaults.set(shopCar, forKey:SHOP_CAR)
		// 创建订单详情视图
		let orderViewController = OrderViewController()
		// 显示新的视图控制器
		self.navigationController!.pushViewController(orderViewController,
			animated:true)
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}
