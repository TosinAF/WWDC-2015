//
//  Utility.swift
//  TosinAfolabi
//
//  Created by Tosin Afolabi on 4/22/15.
//  Copyright (c) 2015 Tosin Afolabi. All rights reserved.
//

import Foundation
import UIKit

private let Device = UIDevice.currentDevice()
private let iosVersion = NSString(string: Device.systemVersion).doubleValue

let iOS8 = iosVersion >= 8
let iOS7 = iosVersion >= 7 && iosVersion < 8

let iPhone6Or6Plus = UIScreen.mainScreen().bounds.width > 320
let iPhone6P = UIScreen.mainScreen().bounds.height == 736.0
let iPhone6 = UIScreen.mainScreen().bounds.height == 667.0
let iPhone5 = UIScreen.mainScreen().bounds.height == 568.0
let iPhone4S = UIScreen.mainScreen().bounds.height == 480.0