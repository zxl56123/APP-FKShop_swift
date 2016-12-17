//
//  AccountViewController.swift
//  FKShop
//
//  Created by yeeku on 16/6/16.
//  Copyright © 2016年 org.crazyit. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		let unselectImage = UIImage(named: ACCOUNTRNMPNG)
		let selectImage = UIImage(named: ACCOUNTONPNG)
		let item = UITabBarItem(title:"疯狂软件", image:unselectImage!
			.withRenderingMode(.alwaysOriginal), selectedImage:
			selectImage!.withRenderingMode(.alwaysOriginal))
		item.tag = 3
		self.tabBarItem = item
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		// 创建和添加显示“关于我们”的UILabel控件
		let titleLabel = UILabel(frame:CGRect(
			x: 0, y: 0, width: GLOBLE_BOUNDS_WIDTH(), height: 30))
		// 背景颜色
		titleLabel.backgroundColor = UIColor.gray
		// 设置字体
		titleLabel.font = UIFont.systemFont(ofSize: 25)
		titleLabel.textAlignment = .center
		titleLabel.text = "关于我们"
		// 添加边框和并设置边框颜色
		titleLabel.layer.borderWidth = 1
		titleLabel.layer.borderColor = UIColor.gray.cgColor
		self.view.addSubview(titleLabel)
		// 创建和添加显示logo的UIImageView控件
		let logo = UIImage(named:"logo108.png")
		let imageView = UIImageView(frame:CGRect(x: GLOBLE_BOUNDS_WIDTH() * 0.15,y: GLOBLE_BOUNDS_HEIGHT() * 0.08, width: 100 , height: 50))
		imageView.image = logo
		imageView.contentMode = .scaleAspectFit
		self.view.addSubview(imageView)
		// 创建和添加显示网址的UILabel控件
		let urlLabel = UILabel(frame:CGRect(
			x: GLOBLE_BOUNDS_WIDTH() * 0.42,y: GLOBLE_BOUNDS_HEIGHT() * 0.09,
			width: GLOBLE_BOUNDS_WIDTH() , height: 40))
		// 设置字体
		urlLabel.font = UIFont.systemFont(ofSize: 22)
		// 设置居左对齐
		urlLabel.textAlignment = .left
		urlLabel.text = "www.fkit.org"
		self.view.addSubview(urlLabel)
		// 创建和添加显示“商家简介”的UITextView控件
		let textView = UITextView(frame:CGRect(
			x: GLOBLE_BOUNDS_WIDTH() * 0.05 , y: GLOBLE_BOUNDS_HEIGHT() * 0.19,
			width: GLOBLE_BOUNDS_WIDTH() * 0.9 , height: 250))
		// 设置背景色
		textView.backgroundColor = UIColor(red:220,
				green:220, blue:220, alpha:0.5)
		// 设置字体
		textView.font = UIFont.systemFont(ofSize: 16)
		// 读取指定文件的内容，并使用textView控件显示文件内容
		let bundle = Bundle.main
		let path = bundle.path(forResource: "fkjava", ofType: "txt")
		textView.text = try! NSString(contentsOfFile: path!,
			encoding: String.Encoding.utf8.rawValue) as String
		// 添加边框和并设置边框颜色
		textView.layer.borderWidth = 1
		textView.layer.borderColor = UIColor.black.cgColor
		self.view.addSubview(textView)
		// 创建和添加显示版权信息的UILabel控件
		let copyrightLabel = UILabel(frame:CGRect(
			x: GLOBLE_BOUNDS_WIDTH() * 0.28,y: GLOBLE_BOUNDS_HEIGHT() * 0.62, width: 200 , height: 30))
		// 设置字体
		copyrightLabel.font = UIFont.systemFont(ofSize: 15)
		copyrightLabel.textAlignment = .left
		copyrightLabel.text = "copyright©2010-2016"
		self.view.addSubview(copyrightLabel)
		// 创建和添加显示商家名称的UILabel控件
		let companyLabel = UILabel(frame:CGRect(
			x: GLOBLE_BOUNDS_WIDTH() * 0.25,y: GLOBLE_BOUNDS_HEIGHT() * 0.65, width: 300 , height: 30))
		// 设置字体
		companyLabel.font = UIFont.systemFont(ofSize: 15)
		companyLabel.textAlignment = .left
		companyLabel.text = "广州为学教育科技有限公司"
		self.view.addSubview(companyLabel)
	}
}
