//
//  TypeViewController.swift
//  FKShop
//
//  Created by yeeku on 16/6/16.
//  Copyright © 2016年 org.crazyit. All rights reserved.
//

import UIKit

class TypeViewController: UIViewController, UITableViewDataSource{
	var articleTypeArray = [ArticleType]()  // UITableView需要显示的数据
	var tableView: UITableView!  // 显示数据的UITableView
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		let unselectImage = UIImage(named: TYPENMPNG)
		let selectImage = UIImage(named: TYPEONPNG)
		// 创建一个UITabBarItem
		let item = UITabBarItem(title:"分类", image:unselectImage!
			.withRenderingMode(.alwaysOriginal), selectedImage:selectImage!
			.withRenderingMode(.alwaysOriginal))
		item.tag = 1
		// 将创建的UITabBarItem设置为视图控制器的TabBarItem
		self.tabBarItem = item
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		// 创建、并添加所有类别的UITableView控件
		tableView = UITableView (frame:CGRect(x: 0, y: 0, width: GLOBLE_BOUNDS_WIDTH(), height: GLOBLE_BOUNDS_HEIGHT() - 108), style:.plain)
		tableView.dataSource = self
		// 设置行高
		tableView.rowHeight = GLOBLE_BOUNDS_HEIGHT() * 0.3
		// 设置分割线
		tableView.separatorStyle = .singleLine
		// 设置表格隐藏多余的分隔线，表格没有数据的时候不显示多余的分隔线
		tableView.tableFooterView = UIView()
		self.view.addSubview(tableView)
	}
	override func viewWillAppear(_ animated: Bool){
		super.viewWillAppear(animated)
		// 异步获取数据
		FKNetworkingUtil.getDataWithAsynchronous(
		{[unowned self] array in
			// 获取数据
			self.articleTypeArray = array as! [ArticleType]
			// 刷新tableView数据
			self.tableView.reloadData()
		}, url:ARTICLETYPE_ACTION, params:nil, clazz:ArticleType.self)
	}
	// 返回指定分区内表格行的数量
	func tableView(_ tableView: UITableView,
		numberOfRowsInSection section:Int) -> Int{
		// 因为每行显示两个类型，因此需要除以rowCellCount
		return articleTypeArray.count == 0 ? 0 :
			(articleTypeArray.count - 1) / rowCellCount + 1
	}
	// 返回表格内每个单元格的控件
	func tableView(_ tableView: UITableView, cellForRowAt
		indexPath: IndexPath) -> UITableViewCell {
		// 自定义UITableViewCell
		var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
			as! ArticleTypeTableViewCell?
		if cell == nil {
			cell = ArticleTypeTableViewCell(style:.default,
											reuseIdentifier:cellID)
		}
		// 当前行数
		let row = indexPath.row
		// 定义一个ArticleType对象
		var articleType: ArticleType! = nil
		// 由于每行显示两个类型，所以循环两次
		for i in 0 ..< rowCellCount {
			// 如果行数量 * 2 + i > 数组的长度 - 1，说明没有数据了，退出循环
			if row * rowCellCount + i > articleTypeArray.count {
				break
			}
			// 根据行数获得本行显示的ArticleType
			articleType = articleTypeArray[row * rowCellCount + i]
			// 类型图片
			let url = FKSHOP_IMAGES_ARTICLETYPE + articleType.code
				+ ".jpg"
			let image = FKNetworkingUtil.getImageWithURLPath(url)
			// 点击的手势处理器，点击时调用cellViewTapped方法
			let recognizer = UITapGestureRecognizer(target:self,
				action:#selector(cellViewTapped(_:)))
			// i = 0 放置在列的第一个视图，否则放第二个视图
			if i == 0 {
				cell!.view1.imageView.image = image
				cell!.view1.nameLabel.text = articleType.name
				// 传递数据
				cell!.view1.code = articleType.code
				cell!.view1.name = articleType.name
				// 为表格行内的控件添加手势处理器之后，表格行的被选中事件将不会被激发
				cell!.view1.addGestureRecognizer(recognizer)  // ①
			}else{
				cell!.view2.imageView.image = image
				cell!.view2.nameLabel.text = articleType.name
				cell!.view2.code = articleType.code
				cell!.view2.name = articleType.name
				cell!.view2.addGestureRecognizer(recognizer)  // ②
			}
		}
		return cell!
	}
	// 手势点击时的处理方法
	func cellViewTapped(_ recognizer: UITapGestureRecognizer){
		// 获得点击的控件
		let view = recognizer.view as! ArticleTypeView
		// 创建商品详情视图
		let articlelViewController = ArticleViewController()
		// 将点击选中的商品code传递给类型视图控制器
		articlelViewController.code = view.code
		self.navigationController!.pushViewController(
			articlelViewController, animated:true)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}
