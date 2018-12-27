//
//  CustomTabBarController.swift
//  TTProgrammaticUI
//
//  Created by Banana Viking on 12/26/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let farmViewController = FarmViewController()
        farmViewController.tabBarItem.image = UIImage(named: "farmTabBarIcon")
        
        let marketViewController = MarketViewController()
        marketViewController.tabBarItem.image = UIImage(named: "marketTabBarIcon")
        
        let numbersViewController = NumbersViewController()
        numbersViewController.tabBarItem.image = UIImage(named: "numbersTabBarIcon")
        
        let shapesViewController = ShapesViewController()
        shapesViewController.tabBarItem.image = UIImage(named: "shapesTabBarIcon")
        
        viewControllers = [farmViewController, marketViewController, numbersViewController, shapesViewController]
    }
}
