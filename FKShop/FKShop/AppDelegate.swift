//
//  AppDelegate.swift
//  FKShop
//
//  Created by yeeku on 16/6/15.
//  Copyright © 2016年 org.crazyit. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, WXApiDelegate{

	var window: UIWindow?


	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
		// 注册AppID:该AppID是是App审核后，由微信开放平台提供的
		WXApi.registerApp("wx2d7efb543bca8631", withDescription:"FKShop_OC")
		return true
	}
	
	func application(app: UIApplication, openURL url: NSURL,
					 options: [String : AnyObject]) -> Bool{
		return WXApi.handleOpenURL(url, delegate:self)
	}
		
// 服务器响应到来时激发该方法
func onResp(resp: BaseResp!) {
	var strTitle = ""
	var strMsg = ""
	if resp.isKindOfClass(SendMessageToWXResp.self) {
		strTitle = "发送媒体消息结果"
	}
	if resp.isKindOfClass(PayResp.self) {
		// 支付返回结果，实际支付结果需要去微信服务器端查询
		strTitle = "支付结果"
		let orderVc = (self.window!.rootViewController! as!
			UINavigationController).visibleViewController as! OrderViewController
		switch resp.errCode {
			case 0:
				strMsg = "恭喜您，支付成功！我们将在48小时内为您安排发货"
				// 处理支付成功的情形
				orderVc.onPaySuccess()
			default:
				strMsg = "支付失败！retcode = \(resp.errCode), retstr = \(resp.errStr)"
				NSLog("%@" , strMsg)
		}
		self.showAlert(strTitle, content: strMsg)
	}
}
	// 工具方法，用于调用UIAlertController来显示提示信息
	func showAlert(title: String, content:String){
		// 获取当前窗口显示的视图控制器
		let vc = (self.window!.rootViewController! as!
			UINavigationController).visibleViewController
		let alert = UIAlertController(title:title, message: content,
			preferredStyle: .Alert)
		alert.addAction(UIAlertAction(title:"确定", style: .Destructive,
			handler: nil))
		// 显示UIAlertController
		vc!.presentViewController(alert, animated: true, completion: nil)
	}

	func applicationWillResignActive(application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
	}

	func applicationDidEnterBackground(application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	}

	func applicationWillEnterForeground(application: UIApplication) {
		// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
	}

	func applicationDidBecomeActive(application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}

	func applicationWillTerminate(application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	}

}

