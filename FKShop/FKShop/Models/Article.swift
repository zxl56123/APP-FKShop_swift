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
	func setPropertyWithAttributes(attributes: NSDictionary) {
		self.id = attributes["id"] as! String
		self.title = attributes["title"] as! String
		self.supplier = attributes["supplier"] as! String
		self.price = attributes["price"] as! NSNumber
		self.image = attributes["image"] as! String
		self.descriptions = attributes["description"] as! String
	}
	// 当程序归档对象时调用该方法
	func encodeWithCoder(aCoder: NSCoder){
		aCoder.encodeObject(self.id, forKey:"id")
		aCoder.encodeObject(self.title, forKey:"title")
		aCoder.encodeObject(self.supplier, forKey:"supplier")
		aCoder.encodeObject(self.price, forKey:"price")
		aCoder.encodeObject(self.image, forKey:"image")
		aCoder.encodeObject(self.descriptions, forKey:"description")
		aCoder.encodeObject(self.buyNum, forKey:"buyNum")
	}
	// 当程序恢复对象时调用该方法
	required init(coder aDecoder: NSCoder) {
		super.init()
		self.id = aDecoder.decodeObjectForKey("id") as! String
		self.title = aDecoder.decodeObjectForKey("title") as! String
		self.supplier = aDecoder.decodeObjectForKey("supplier") as! String
		self.price = aDecoder.decodeObjectForKey("price") as! NSNumber
		self.image = aDecoder.decodeObjectForKey("image") as! String
		self.descriptions = aDecoder.decodeObjectForKey("description") as! String
		self.buyNum = aDecoder.decodeObjectForKey("buyNum") as! String
	}
}
