//
//  ViewController.swift
//  FKShop
//
//  Created by yeeku on 16/6/15.
//  Copyright © 2016年 org.crazyit. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController, UITabBarControllerDelegate{
	var editImage: UIImage!
	override func viewDidLoad() {
		super.viewDidLoad()
		// 设置导航栏的背景颜色
		self.navigationController!.navigationBar.barTintColor =
			UIColor(red:251.0 / 255, green:56.0/255, blue:7.0/255, alpha:1)
		// navigationBar.translucent默认为真，此时下面控件的初始坐标默认在(0,0)
		// 将该属性设置为假时，下面控件的初始坐标默认在(0,64)
		self.navigationController!.navigationBar.translucent = false
		editImage = UIImage(named:EDITPNG)
		// 设置当前视图关联的导航项的标题
		self.navigationItem.titleView = UIImageView(image:editImage)
		// 创建导航项左右的按钮图片
		let leftImage = UIImage(named:MENUTOPLEFTPNG)
		let rightImage = UIImage(named:MENUTOPRIGHTPNG)
		// 这两个按钮暂时还未分配事件处理方法
		let leftBarButtonItem = UIBarButtonItem(image:leftImage!
			.imageWithRenderingMode(.AlwaysOriginal),
			style:.Plain,target:self, action:nil)
		let rightBarButtonItem =  UIBarButtonItem(image:rightImage!
			.imageWithRenderingMode(.AlwaysOriginal),
			style:.Plain, target:self, action:nil)
		// 默认选择第一个视图控制器
		self.selectedIndex = 0
		// 设置代理
		self.delegate = self
		self.navigationItem.leftBarButtonItem = leftBarButtonItem
		self.navigationItem.rightBarButtonItem = rightBarButtonItem
	}
	
	// 选中不同的选项卡时自动激发该方法
	func tabBarController(tabBarController: UITabBarController,
		didSelectViewController viewController:UIViewController){
		// 根据不同的选项卡来更改导航条的标题
		if viewController.tabBarItem.tag == 0 {
			self.navigationItem.titleView = UIImageView(image:editImage)
		}
		else if viewController.tabBarItem.tag == 1 {
			self.navigationItem.titleView = FKUtils.getCustomLaber("物品分类")
		}
		else if viewController.tabBarItem.tag == 2 {
			self.navigationItem.titleView = FKUtils.getCustomLaber("购物车")
		}
		else{
			self.navigationItem.titleView = FKUtils.getCustomLaber("疯狂软件")
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}

