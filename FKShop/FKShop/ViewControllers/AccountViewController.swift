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
			.imageWithRenderingMode(.AlwaysOriginal), selectedImage:
			selectImage!.imageWithRenderingMode(.AlwaysOriginal))
		item.tag = 3
		self.tabBarItem = item
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		// 创建和添加显示“关于我们”的UILabel控件
		let titleLabel = UILabel(frame:CGRectMake(
			0, 0, GLOBLE_BOUNDS_WIDTH(), 30))
		// 背景颜色
		titleLabel.backgroundColor = UIColor.grayColor()
		// 设置字体
		titleLabel.font = UIFont.systemFontOfSize(25)
		titleLabel.textAlignment = .Center
		titleLabel.text = "关于我们"
		// 添加边框和并设置边框颜色
		titleLabel.layer.borderWidth = 1
		titleLabel.layer.borderColor = UIColor.grayColor().CGColor
		self.view.addSubview(titleLabel)
		// 创建和添加显示logo的UIImageView控件
		let logo = UIImage(named:"logo108.png")
		let imageView = UIImageView(frame:CGRectMake(GLOBLE_BOUNDS_WIDTH() * 0.15,GLOBLE_BOUNDS_HEIGHT() * 0.08, 100 , 50))
		imageView.image = logo
		imageView.contentMode = .ScaleAspectFit
		self.view.addSubview(imageView)
		// 创建和添加显示网址的UILabel控件
		let urlLabel = UILabel(frame:CGRectMake(
			GLOBLE_BOUNDS_WIDTH() * 0.42,GLOBLE_BOUNDS_HEIGHT() * 0.09,
			GLOBLE_BOUNDS_WIDTH() , 40))
		// 设置字体
		urlLabel.font = UIFont.systemFontOfSize(22)
		// 设置居左对齐
		urlLabel.textAlignment = .Left
		urlLabel.text = "www.fkit.org"
		self.view.addSubview(urlLabel)
		// 创建和添加显示“商家简介”的UITextView控件
		let textView = UITextView(frame:CGRectMake(
			GLOBLE_BOUNDS_WIDTH() * 0.05 , GLOBLE_BOUNDS_HEIGHT() * 0.19,
			GLOBLE_BOUNDS_WIDTH() * 0.9 , 250))
		// 设置背景色
		textView.backgroundColor = UIColor(red:220,
				green:220, blue:220, alpha:0.5)
		// 设置字体
		textView.font = UIFont.systemFontOfSize(16)
		// 读取指定文件的内容，并使用textView控件显示文件内容
		let bundle = NSBundle.mainBundle()
		let path = bundle.pathForResource("fkjava", ofType: "txt")
		textView.text = try! NSString(contentsOfFile: path!,
			encoding: NSUTF8StringEncoding) as String
		// 添加边框和并设置边框颜色
		textView.layer.borderWidth = 1
		textView.layer.borderColor = UIColor.blackColor().CGColor
		self.view.addSubview(textView)
		// 创建和添加显示版权信息的UILabel控件
		let copyrightLabel = UILabel(frame:CGRectMake(
			GLOBLE_BOUNDS_WIDTH() * 0.28,GLOBLE_BOUNDS_HEIGHT() * 0.62, 200 , 30))
		// 设置字体
		copyrightLabel.font = UIFont.systemFontOfSize(15)
		copyrightLabel.textAlignment = .Left
		copyrightLabel.text = "copyright©2010-2016"
		self.view.addSubview(copyrightLabel)
		// 创建和添加显示商家名称的UILabel控件
		let companyLabel = UILabel(frame:CGRectMake(
			GLOBLE_BOUNDS_WIDTH() * 0.25,GLOBLE_BOUNDS_HEIGHT() * 0.65, 300 , 30))
		// 设置字体
		companyLabel.font = UIFont.systemFontOfSize(15)
		companyLabel.textAlignment = .Left
		companyLabel.text = "广州为学教育科技有限公司"
		self.view.addSubview(companyLabel)
	}
}
