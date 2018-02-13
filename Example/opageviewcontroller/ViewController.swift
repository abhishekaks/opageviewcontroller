//
//  ViewController.swift
//  opageviewcontroller
//
//  Created by abhishekaks on 08/21/2017.
//  Copyright (c) 2017 abhishekaks. All rights reserved.
//

import UIKit
import opageviewcontroller

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func testOPageViewController(){
        var pages:[OPage] = [OPage]()
        
        // First View Controller
        let vcOne:UIViewController = UIViewController.init()
        vcOne.view.backgroundColor = UIColor.red
        var page:OPage = OPage.init(title:"Food", viewController: vcOne)
        pages.append(page)
        
        // Second View Controller
        let vcTwo:UIViewController = UIViewController.init()
        vcTwo.view.backgroundColor = UIColor.green
        page = OPage.init(title:"Elements Mall", viewController: vcTwo)
        pages.append(page)
        
        // Third View Controller
        let vcThree:UIViewController = UIViewController.init()
        vcThree.view.backgroundColor = UIColor.blue
        page = OPage.init(title:"My Departmental Store", viewController: vcThree)
        pages.append(page)
        
        // Fourth View Controller
        let vcFour:UIViewController = UIViewController.init()
        vcFour.view.backgroundColor = UIColor.cyan
        page = OPage.init(title:"Some Supermarket", viewController: vcFour)
        pages.append(page)
        
        // Fifth View Controller
        let vcFive:UIViewController = UIViewController.init()
        vcFive.view.backgroundColor = UIColor.cyan
        page = OPage.init(title:"Fashionista", viewController: vcFive)
        pages.append(page)
        
        let pageController: OPageViewController = OPageViewController.init(pageTitleBounds: .stretchable, titleItemWidth: 120, titleItemHeight: 50, indicatorWidthRatio: 0.4)
        pageController.uiConfig.rightSeparatorColor = UIColor.clear
        pageController.uiConfig.leftSeparatorColor = UIColor.clear
        pageController.uiConfig.bottomSeparatorColor = UIColor.clear
        pageController.uiConfig.pageTitleBounds = .stretchable
        pageController.uiConfig.flexibleTitleWidth = true
        pageController.uiConfig.minimumTitleItemWidth = 50
        pageController.uiConfig.textAlignment = .left
        pageController.uiConfig.paddingTitle = 10
        pageController.uiConfig.leadingIndicator = 10
        pageController.pages = pages
        
        // Different highlighted Color for a Particular Tab
        page.uiConfig = pageController.uiConfig
        page.uiConfig?.highlightedColor = UIColor.red
        
        if let navController:UINavigationController = self.navigationController{
            navController.pushViewController(pageController, animated: true)
        }
    }
    
    @IBAction func btnTestOPageClicked(_ sender: Any) {
        testOPageViewController()
    }
}
