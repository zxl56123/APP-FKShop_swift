//
//  Common.swift
//  FKShop
//
//  Created by yeeku on 16/6/16.
//  Copyright © 2016年 org.crazyit. All rights reserved.
//

import UIKit

// 全局bounds
func GLOBLE_BOUNDS() -> CGRect {
	return UIScreen.mainScreen().bounds
}
// 全局宽度
func GLOBLE_BOUNDS_WIDTH() -> CGFloat{
	return UIScreen.mainScreen().bounds.size.width
}
// 全局高度
func GLOBLE_BOUNDS_HEIGHT() -> CGFloat{
	return UIScreen.mainScreen().bounds.size.height
}
// 获取视图的宽度
func GET_VIEW_WIDTH(view: UIView) -> CGFloat{
	return view.frame.size.width
}
// 获取视图的高度
func GET_VIEW_HEIGHT(view: UIView) -> CGFloat{
	return view.frame.size.height
}
// 外网服务器地址为: "http://115.29.28.226:80/fk_ec/"
let CONTEXT_ROOT = "http://115.29.28.226:80/fk_ec/"
//let CONTEXT_ROOT = "http://192.168.1.104:8888/fk_ec/"
// 服务器图片路径
let FKSHOP_IMAGES = CONTEXT_ROOT + "images/"
let FKSHOP_IMAGES_ARTICLE = CONTEXT_ROOT + "images/article/"
let FKSHOP_IMAGES_ARTICLETYPE = CONTEXT_ROOT + "articleType/"
// UITabBarItem图标路径
let HOMENMPNG = "guide_home_nm.png"
let HOMEONPNG = "guide_home_on.png"
let TYPENMPNG = "guide_tfaccount_nm.png"
let TYPEONPNG = "guide_tfaccount_on.png"
let SHOPCARNMPNG = "guide_cart_nm.png"
let SHOPCARONPNG = "guide_cart_on.png"
let ACCOUNTRNMPNG = "guide_account_nm.png"
let ACCOUNTONPNG = "guide_account_on.png"
// 按钮图片
let PUTINPNG = "put_in.png"
let SUBMITPNG = "submit.png"
let BUYNOWJPG = "buy_now.png"
let JIESUANPNG = "pay_now.png"
let JIESUANNOPNG = "pay_now_no.png"
let MENUTOPLEFTPNG = "menu_top_left.png"
let MENUTOPRIGHTPNG = "menu_top_right.png"
let EDITPNG = "bg_menu_edit.png"

// 请求获取json数据路径
let ARTICLETYPE_ACTION = CONTEXT_ROOT + "android/articleType.action"
let ARTICLE_ACTION = CONTEXT_ROOT + "android/article.action?code="

// 定义购物车的key
let SHOP_CAR = "shopCar"