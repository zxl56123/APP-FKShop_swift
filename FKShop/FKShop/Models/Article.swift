//
//  Article.swift
//  FKShop
//
//  Created by yeeku on 16/6/15.
//  Copyright © 2016年 org.crazyit. All rights reserved.
//

import Foundation
@objc class Article : NSObject, NSCoding{
	// id
	var id: String!
	// 标题
	var title: String!
	// 供应商
	var supplier: String!
	// 价格
	var price: NSNumber!
	// 封面
	var image: String!
	// 描述
	var descriptions: String!
	// 购买数量
	var buyNum: String!
	override init() {
		super.init()
	}
	// 根据字典中的数据设置到对应的属性当中
	func setPropertyWithAttributes(_ attributes: NSDictionary) {
		self.id = attributes["id"] as! String
		self.title = attributes["title"] as! String
		self.supplier = attributes["supplier"] as! String
		self.price = attributes["price"] as! NSNumber
		self.image = attributes["image"] as! String
		self.descriptions = attributes["description"] as! String
	}
	// 当程序归档对象时调用该方法
	func encode(with aCoder: NSCoder){
		aCoder.encode(self.id, forKey:"id")
		aCoder.encode(self.title, forKey:"title")
		aCoder.encode(self.supplier, forKey:"supplier")
		aCoder.encode(self.price, forKey:"price")
		aCoder.encode(self.image, forKey:"image")
		aCoder.encode(self.descriptions, forKey:"description")
		aCoder.encode(self.buyNum, forKey:"buyNum")
	}
	// 当程序恢复对象时调用该方法
	required init(coder aDecoder: NSCoder) {
		super.init()
		self.id = aDecoder.decodeObject(forKey: "id") as! String
		self.title = aDecoder.decodeObject(forKey: "title") as! String
		self.supplier = aDecoder.decodeObject(forKey: "supplier") as! String
		self.price = aDecoder.decodeObject(forKey: "price") as! NSNumber
		self.image = aDecoder.decodeObject(forKey: "image") as! String
		self.descriptions = aDecoder.decodeObject(forKey: "description") as! String
		self.buyNum = aDecoder.decodeObject(forKey: "buyNum") as! String
	}
}
