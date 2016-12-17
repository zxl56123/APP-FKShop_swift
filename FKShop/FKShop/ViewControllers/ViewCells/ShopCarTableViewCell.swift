//
//  ShopCarTableViewCell.swift
//  FKShop
//
//  Created by yeeku on 16/6/16.
//  Copyright © 2016年 org.crazyit. All rights reserved.
//

import UIKit

class ShopCarTableViewCell: UITableViewCell {
	// 显示商品图片的UIImageView控件
	var articleImageView: UIImageView!
	// 显示商品名称的UILabel控件
	var titleLabel: UILabel!
	// 显示供应商的UILabel控件
	var supplierLabel: UILabel!
	// 显示商品价格的UILabel控件
	var priceLabel: UILabel!
	// 显示购买数量的UILabel控件
	var buyNumLabel: UILabel!
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		// 创建和添加UIImageView控件
		self.articleImageView = UIImageView(frame:CGRectMake(0, 5, GLOBLE_BOUNDS_WIDTH() * 0.3,
			GLOBLE_BOUNDS_HEIGHT() * 0.16))
		// 设置UIImageView显示的图片保持纵横比缩放
		self.articleImageView.contentMode = .ScaleAspectFit;
		self.addSubview(self.articleImageView)
		// 创建和添加UILabel控件
		self.titleLabel = UILabel(frame:
			CGRectMake(GLOBLE_BOUNDS_WIDTH() * 0.3 + 5, 0,
			GLOBLE_BOUNDS_WIDTH() * 0.42 , GLOBLE_BOUNDS_HEIGHT() * 0.11))
		// 设置背景色
		self.titleLabel.backgroundColor = UIColor.clearColor()
		// 设置字体和颜色
		self.titleLabel.font = UIFont.systemFontOfSize(15)
		self.titleLabel.textColor = UIColor.blackColor()
		// 设置居左对齐
		self.titleLabel.textAlignment = .Left
		// 设置最多显示3行
		self.titleLabel.numberOfLines = 3;
		self.addSubview(self.titleLabel)
		// 创建和添加UILabel控件
		self.supplierLabel = UILabel(frame:CGRectMake(
			GLOBLE_BOUNDS_WIDTH() * 0.3 + 5, GLOBLE_BOUNDS_WIDTH() * 0.2,
			GLOBLE_BOUNDS_WIDTH() * 0.3, GLOBLE_BOUNDS_HEIGHT() * 0.05))
		// 设置背景色
		self.supplierLabel.backgroundColor = UIColor.clearColor()
		// 设置字体和颜色
		self.supplierLabel.font = UIFont.systemFontOfSize(18)
		self.supplierLabel.textColor = UIColor.grayColor()
		// 设置居左对齐
		self.supplierLabel.textAlignment = .Left;
		self.addSubview(self.supplierLabel)
		// 创建和添加UILabel控件
		self.priceLabel = UILabel(frame:CGRectMake(GLOBLE_BOUNDS_WIDTH() - 90,
			10, 200, 30))
		// 设置背景色
		self.priceLabel.backgroundColor = UIColor.clearColor()
		// 设置字体和颜色
		self.priceLabel.font = UIFont.systemFontOfSize(18)
		self.priceLabel.textColor = UIColor.redColor()
		// 设置居左对齐
		self.priceLabel.textAlignment = .Left;
		self.addSubview(self.priceLabel)
		// 创建和添加UILabel控件
		self.buyNumLabel = UILabel(frame:CGRectMake(GLOBLE_BOUNDS_WIDTH()
			- 70, 40, 200, 30))
		// 设置背景色
		self.buyNumLabel.backgroundColor = UIColor.clearColor()
		// 设置字体和颜色
		self.buyNumLabel.font = UIFont.systemFontOfSize(18)
		self.buyNumLabel.textColor = UIColor.blackColor()
		// 设置居左对齐
		self.buyNumLabel.textAlignment = .Left;
		self.addSubview(self.buyNumLabel)
		// 为该控件设置边框
		self.layer.borderWidth = 1;
		self.layer.borderColor = UIColor.grayColor().CGColor;
	}
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
