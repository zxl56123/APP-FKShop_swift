//
//  ArticleTableViewCell.swift
//  FKShop
//
//  Created by yeeku on 16/6/16.
//  Copyright © 2016年 org.crazyit. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
	// 显示物品图片的UIImageView控件
	var articleImageView: UIImageView!
	// 显示物品名称的UILabel控件
	var titleLabel: UILabel!
	// 显示物品供应商的UILabel控件
	var supplierLabel: UILabel!
	// 显示物品价格的UILabel控件
	var priceLabel: UILabel!
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		var fontSize: CGFloat = 12;
		super.init(style:style, reuseIdentifier:reuseIdentifier)
		// 对于iPhone 6s plus
		if GLOBLE_BOUNDS_WIDTH() == 414 && GLOBLE_BOUNDS_HEIGHT() == 736{
			fontSize = 17;
			// 对于iPhone 6s
		}else if GLOBLE_BOUNDS_WIDTH() == 375 && GLOBLE_BOUNDS_HEIGHT() == 667{
			fontSize = 15;
			// 对于iPhone 5s
		}else if GLOBLE_BOUNDS_WIDTH() == 320 && GLOBLE_BOUNDS_HEIGHT() == 568 {
			fontSize = 13;
			// 对于iPhone 4s
		}else{
			fontSize = 12;
		}
		self.backgroundColor = UIColor.clear
		// 创建、并添加UIImageView控件
		self.articleImageView = UIImageView(frame:CGRect(x: 0, y: 5, width: GLOBLE_BOUNDS_WIDTH() * 0.4,
			height: GLOBLE_BOUNDS_HEIGHT() * 0.21))
		self.articleImageView.contentMode = .scaleAspectFit;
		self.addSubview(self.articleImageView)
		// 创建、并添加UILabel控件
		self.titleLabel = UILabel(frame:CGRect(x: GLOBLE_BOUNDS_WIDTH() * 0.4,
			y: 0, width: GLOBLE_BOUNDS_WIDTH() * 0.57 , height: 60))
		// 设置背景色
		self.titleLabel.backgroundColor = UIColor.clear
		// 设置字体
		self.titleLabel.font = UIFont.boldSystemFont(ofSize: fontSize)
		// 设置居左对齐
		self.titleLabel.textAlignment = .left
		// 设置最多显示3行
		self.titleLabel.numberOfLines = 3;
		self.addSubview(self.titleLabel)
		// 创建、并添加UILabel对象
		self.supplierLabel = UILabel(frame:CGRect(
			x: GLOBLE_BOUNDS_WIDTH() * 0.4, y: GLOBLE_BOUNDS_HEIGHT() * 0.15,
			width: GLOBLE_BOUNDS_WIDTH() * 0.6, height: 10))
		// 设置背景色
		self.supplierLabel.backgroundColor = UIColor.clear
		// 设置字体和颜色
		self.supplierLabel.font = UIFont.boldSystemFont(ofSize: fontSize)
		self.supplierLabel.textColor = UIColor.gray
		// 设置居左对齐
		self.supplierLabel.textAlignment = .left;
		self.addSubview(self.supplierLabel)
		// 创建、并添加UILabel对象
		self.priceLabel = UILabel(frame:CGRect(
			x: GLOBLE_BOUNDS_WIDTH() * 0.4, y: GLOBLE_BOUNDS_HEIGHT() * 0.2,
			width: GLOBLE_BOUNDS_WIDTH() * 0.6, height: 10))
		// 设置背景色
		self.priceLabel.backgroundColor = UIColor.clear
		// 设置字体和颜色
		self.priceLabel.font = UIFont.boldSystemFont(ofSize: fontSize)
		self.priceLabel.textColor = UIColor.red
		// 设置居左对齐
		self.priceLabel.textAlignment = .left
		self.addSubview(self.priceLabel)
		// 为该自定义的表格行控件添加边框
		self.layer.borderWidth = 1;
		self.layer.borderColor = UIColor.gray.cgColor;
	}
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
