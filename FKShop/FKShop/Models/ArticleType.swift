//
//  ArticleType.swift
//  FKShop
//
//  Created by yeeku on 16/6/15.
//  Copyright © 2016年 org.crazyit. All rights reserved.
//

import Foundation
import Foundation
@objc class ArticleType : NSObject {
	var code: String!
	var name: String!
	// 根据字典中的数据设置到对应的属性中
	func setPropertyWithAttributes(attributes: NSDictionary){
		self.code = attributes["code"] as! String
		self.name = attributes["name"] as! String
	}
}