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
	override func draw(_ rect: CGRect) {
		let ctx = UIGraphicsGetCurrentContext()
		// 线宽
		ctx?.setLineWidth(2)
		// 设置画笔的颜色
		ctx?.setStrokeColor(UIColor.gray.cgColor)
		// 定义绘制直线的两个端点
		let points = [CGPoint(x: 0, y: 10), CGPoint(x: GLOBLE_BOUNDS_WIDTH()
			- 20, y: 10)]
		// 画直线
		//CGContextStrokeLineSegments(ctx, points, 2);
	}
	// 初始化方法
	override init(frame: CGRect){
		super.init(frame:frame)
		// 设置该控件背景色为白色
		self.backgroundColor = UIColor.white
	}
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
