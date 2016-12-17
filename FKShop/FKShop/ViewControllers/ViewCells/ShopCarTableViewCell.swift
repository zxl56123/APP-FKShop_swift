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
		self.articleImageView = UIImageView(frame:CGRect(x: 0, y: 5, width: GLOBLE_BOUNDS_WIDTH() * 0.3,
			height: GLOBLE_BOUNDS_HEIGHT() * 0.16))
		// 设置UIImageView显示的图片保持纵横比缩放
		self.articleImageView.contentMode = .scaleAspectFit;
		self.addSubview(self.articleImageView)
		// 创建和添加UILabel控件
		self.titleLabel = UILabel(frame:
			CGRect(x: GLOBLE_BOUNDS_WIDTH() * 0.3 + 5, y: 0,
			width: GLOBLE_BOUNDS_WIDTH() * 0.42 , height: GLOBLE_BOUNDS_HEIGHT() * 0.11))
		// 设置背景色
		self.titleLabel.backgroundColor = UIColor.clear
		// 设置字体和颜色
		self.titleLabel.font = UIFont.systemFont(ofSize: 15)
		self.titleLabel.textColor = UIColor.black
		// 设置居左对齐
		self.titleLabel.textAlignment = .left
		// 设置最多显示3行
		self.titleLabel.numberOfLines = 3;
		self.addSubview(self.titleLabel)
		// 创建和添加UILabel控件
		self.supplierLabel = UILabel(frame:CGRect(
			x: GLOBLE_BOUNDS_WIDTH() * 0.3 + 5, y: GLOBLE_BOUNDS_WIDTH() * 0.2,
			width: GLOBLE_BOUNDS_WIDTH() * 0.3, height: GLOBLE_BOUNDS_HEIGHT() * 0.05))
		// 设置背景色
		self.supplierLabel.backgroundColor = UIColor.clear
		// 设置字体和颜色
		self.supplierLabel.font = UIFont.systemFont(ofSize: 18)
		self.supplierLabel.textColor = UIColor.gray
		// 设置居左对齐
		self.supplierLabel.textAlignment = .left;
		self.addSubview(self.supplierLabel)
		// 创建和添加UILabel控件
		self.priceLabel = UILabel(frame:CGRect(x: GLOBLE_BOUNDS_WIDTH() - 90,
			y: 10, width: 200, height: 30))
		// 设置背景色
		self.priceLabel.backgroundColor = UIColor.clear
		// 设置字体和颜色
		self.priceLabel.font = UIFont.systemFont(ofSize: 18)
		self.priceLabel.textColor = UIColor.red
		// 设置居左对齐
		self.priceLabel.textAlignment = .left;
		self.addSubview(self.priceLabel)
		// 创建和添加UILabel控件
		self.buyNumLabel = UILabel(frame:CGRect(x: GLOBLE_BOUNDS_WIDTH()
			- 70, y: 40, width: 200, height: 30))
		// 设置背景色
		self.buyNumLabel.backgroundColor = UIColor.clear
		// 设置字体和颜色
		self.buyNumLabel.font = UIFont.systemFont(ofSize: 18)
		self.buyNumLabel.textColor = UIColor.black
		// 设置居左对齐
		self.buyNumLabel.textAlignment = .left;
		self.addSubview(self.buyNumLabel)
		// 为该控件设置边框
		self.layer.borderWidth = 1;
		self.layer.borderColor = UIColor.gray.cgColor;
	}
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
