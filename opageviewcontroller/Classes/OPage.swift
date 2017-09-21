//
//  OPage.swift
//  PageViewControllerProject
//
//  Created by Abhishek Singh on 27/06/17.
//  Copyright © 2017 Abhishek Singh. All rights reserved.
//

import UIKit

public class OPage: NSObject {
    
    public var viewController:UIViewController
    public var title:String
    
    public init(title:String, viewController:UIViewController) {
        self.viewController = viewController
        self.title = title
        super.init()
    }
}
