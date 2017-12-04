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
        var page:OPage = OPage.init(title:"VC1", viewController: vcOne)
        pages.append(page)
        
        // Second View Controller
        let vcTwo:UIViewController = UIViewController.init()
        vcTwo.view.backgroundColor = UIColor.green
        page = OPage.init(title:"VC2", viewController: vcTwo)
        pages.append(page)
        
        // Third View Controller
        let vcThree:UIViewController = UIViewController.init()
        vcThree.view.backgroundColor = UIColor.blue
        page = OPage.init(title:"VC3", viewController: vcThree)
        pages.append(page)
        
        // Fourth View Controller
        let vcFour:UIViewController = UIViewController.init()
        vcFour.view.backgroundColor = UIColor.cyan
        page = OPage.init(title:"VC4", viewController: vcFour)
        pages.append(page)
        
        let pageController: OPageViewController = OPageViewController.init(pageTitleBounds: .stretchable, titleItemWidth: 120, titleItemHeight: 50, indicatorWidthRatio: 0.5)
        pageController.uiConfig.rightSeparatorColor = UIColor.clear
        pageController.uiConfig.leftSeparatorColor = UIColor.clear
        pageController.uiConfig.bottomSeparatorColor = UIColor.clear
        pageController.uiConfig.pageTitleBounds = .stretchable
        pageController.uiConfig.flexibleTitleWidth = true
        pageController.uiConfig.minimumTitleItemWidth = 120
        pageController.pages = pages
        
        if let navController:UINavigationController = self.navigationController{
            navController.pushViewController(pageController, animated: true)
        }
    }
    
    @IBAction func btnTestOPageClicked(_ sender: Any) {
        testOPageViewController()
    }
}
