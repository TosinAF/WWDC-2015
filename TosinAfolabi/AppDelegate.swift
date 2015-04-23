//
//  AppDelegate.swift
//  TosinAfolabi
//
//  Created by Tosin Afolabi on 4/21/15.
//  Copyright (c) 2015 Tosin Afolabi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var window: UIWindow? = {
        let win = UIWindow(frame: UIScreen.mainScreen().bounds)
        win.backgroundColor = UIColor.whiteColor()
        win.rootViewController = NavigationController()
        return win
    }()
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        UIApplication.sharedApplication().setStatusBarHidden(true, withAnimation: .None)
        window?.makeKeyAndVisible()
        return true
    }
}

