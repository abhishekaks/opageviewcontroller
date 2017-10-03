//
//  OPageViewTitleUI.swift
//  PageViewControllerProject
//
//  Created by Abhishek Singh on 03/07/17.
//  Copyright © 2017 Abhishek Singh. All rights reserved.
//

import UIKit

public struct OPageViewTitleUI {
    var separatorColor: UIColor
    var titleColor: UIColor
    var font:UIFont
    var highlightedFont: UIFont
    var highlightedColor: UIColor
    var highlightedTitleColor: UIColor
    
    init(separatorColor: UIColor = UIColor(red: 148.0/255.0, green: 148.0/255.0, blue: 148.0/255.0, alpha: 1.0),
         titleColor: UIColor = UIColor(red: 148.0/255.0, green: 148.0/255.0, blue: 148.0/255.0, alpha: 1.0),
         font:UIFont = UIFont(name: "HelveticaNeue-Light", size: 14)!,
         highlightedFont:UIFont = UIFont(name: "HelveticaNeue-Medium", size: 15)!,
         highlightedColor: UIColor = UIColor(red: 52.0/255.0, green: 179.0/255.0, blue: 231.0/255.0, alpha: 1.0),
         highlightedTitleColor: UIColor = UIColor(red: 52.0/255.0, green: 179.0/255.0, blue: 231.0/255.0, alpha: 1.0)) {
        self.separatorColor = separatorColor
        self.titleColor = titleColor
        self.font = font
        self.highlightedFont = highlightedFont
        self.highlightedColor = highlightedColor
        self.highlightedTitleColor = highlightedTitleColor
    }
}
