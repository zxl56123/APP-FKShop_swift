//
//  LineView.swift
//  FKShop
//
//  Created by yeeku on 16/6/16.
//  Copyright © 2016年 org.crazyit. All rights reserved.
//

import UIKit

class LineView: UIView {
	// 重写drawRect:方法，绘制自定义内容
	override func drawRect(rect: CGRect) {
		let ctx = UIGraphicsGetCurrentContext()
		// 线宽
		CGContextSetLineWidth(ctx, 2)
		// 设置画笔的颜色
		CGContextSetStrokeColorWithColor(ctx, UIColor.grayColor().CGColor)
		// 定义绘制直线的两个端点
		let points = [CGPointMake(0, 10), CGPointMake(GLOBLE_BOUNDS_WIDTH()
			- 20, 10)]
		// 画直线
		CGContextStrokeLineSegments(ctx, points, 2);
	}
	// 初始化方法
	override init(frame: CGRect){
		super.init(frame:frame)
		// 设置该控件背景色为白色
		self.backgroundColor = UIColor.whiteColor()
	}
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
