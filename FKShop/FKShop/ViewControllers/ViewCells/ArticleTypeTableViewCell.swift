//
//  ArticleTypeTableViewCell.swift
//  FKShop
//
//  Created by yeeku on 16/6/16.
//  Copyright © 2016年 org.crazyit. All rights reserved.
//

import UIKit

class ArticleTypeTableViewCell: UITableViewCell {
	var view1: ArticleTypeView!
	var view2: ArticleTypeView!
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		// 定义宽度
		let width = GLOBLE_BOUNDS_WIDTH() / 2;
		// 创建第一个自定义的ArticleTypeView控件
		self.view1 = ArticleTypeView(frame:
			CGRect(x: 0, y: 0, width: width, height: GLOBLE_BOUNDS_HEIGHT() * 0.3))
		// 添加第一个控件
		self.contentView.addSubview(self.view1)
		// 创建第二个自定义的ArticleTypeView控件
		self.view2 = ArticleTypeView(frame:
			CGRect(x: width, y: 0, width: width, height: GLOBLE_BOUNDS_HEIGHT() * 0.3))
		// 添加第二个控件
		self.contentView.addSubview(self.view2)
	}
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
