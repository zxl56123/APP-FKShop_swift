//
//  ArticleTypeView.swift
//  FKShop
//
//  Created by yeeku on 16/6/16.
//  Copyright © 2016年 org.crazyit. All rights reserved.
//

import UIKit

class ArticleTypeView: UIView {
	// 类型图片
	var imageView: UIImageView!
	// 类型名称
	var nameLabel: UILabel!
	var code: String!
	var name: String!
	// 该View负责显示的物品
	var article: Article!
	override init(frame: CGRect) {
		super.init(frame: frame)
		var orderSize: CGFloat = 16
		// 对于iPhone 6s plus
		if GLOBLE_BOUNDS_WIDTH() == 414 && GLOBLE_BOUNDS_HEIGHT() == 736 {
			orderSize = 16
		// 对于iPhone 6s
		}else if GLOBLE_BOUNDS_WIDTH() == 375 && GLOBLE_BOUNDS_HEIGHT() == 667{
			orderSize = 14
		// 对于iPhone 5s
		}else if GLOBLE_BOUNDS_WIDTH() == 320 && GLOBLE_BOUNDS_HEIGHT() == 568{
			orderSize = 12
		// 对于iPhone 4s
		}else{
			orderSize = 10
		}
		let width = GLOBLE_BOUNDS_WIDTH() / 2 - 10
		// 创建并添加UIImageView控件
		self.imageView = UIImageView(frame: CGRect(x: 0, y: 40, width: width,
			height: GLOBLE_BOUNDS_HEIGHT() * 0.3 - 50))
		// 设置图片保持纵横比缩放
		self.imageView.contentMode = .scaleAspectFit
		self.addSubview(self.imageView)
		// 创建、并添加UILabel控件
		self.nameLabel = UILabel(frame:CGRect(x: 0, y: 10, width: width, height: 20))
		// 设置背景色为透明色
		self.nameLabel.backgroundColor = UIColor.clear
		// 设置文字的字体
		self.nameLabel.font = UIFont.systemFont(ofSize: orderSize)
		// 设置居中对齐
		self.nameLabel.textAlignment = .center
		self.addSubview(self.nameLabel)
		// 为该控件添加边框
		self.layer.borderWidth = 1
		self.layer.borderColor = UIColor.gray.cgColor
	}
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
