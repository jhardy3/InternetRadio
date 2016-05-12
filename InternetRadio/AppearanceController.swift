//
//  AppearanceController.swift
//  InternetRadio
//
//  Created by Jake Hardy on 3/24/16.
//  Copyright © 2016 NSDesert. All rights reserved.
//

import Foundation
import UIKit

class AppearanceController {
    
    static func initializaeAppearanceDefaults() {
        
        let color = colorWithHexString("ff6666", alpha: 1.0)
        
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        UINavigationBar.appearance().backgroundColor = color
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        
        UINavigationBar.appearance().barTintColor = color
        UIToolbar.appearance().barTintColor = color
        UINavigationBar.appearance().backgroundColor = UIColor.whiteColor()
        
        UITabBar.appearance().backgroundColor = color
        UITabBar.appearance().tintColor = color
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: color], forState: .Normal)

        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: color], forState: .Application)
        
        UIBarButtonItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.whiteColor()], forState: .Normal)
         UIBarButtonItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.whiteColor()], forState: .Selected)
    }
    
    
}