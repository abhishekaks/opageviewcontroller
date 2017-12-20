//
//  OPageViewTitleUI.swift
//  PageViewControllerProject
//
//  Created by Abhishek Singh on 03/07/17.
//  Copyright © 2017 Abhishek Singh. All rights reserved.
//

import UIKit

public enum SelectedTabPosition {
    case left
    case center
    case right
}

public struct OPageViewTitleUI {
    public var rightSeparatorColor: UIColor
    public var leftSeparatorColor: UIColor
    public var bottomSeparatorColor: UIColor
    public var titleColor: UIColor
    public var font:UIFont
    public var highlightedFont: UIFont
    public var highlightedColor: UIColor
    public var highlightedTitleColor: UIColor
    public var pageTitleBounds:OPageTitleBounds = .fixed
    public var titleItemWidth:Float = Float.greatestFiniteMagnitude
    public var titleItemHeight:Float = 50
    public var indicatorWidthRatio:Float = 1
    public var textAlignment:NSTextAlignment
    public var flexibleTitleWidth:Bool
    public var minimumTitleItemWidth:Float = 0
    public var paddingTitle:Float = 0
    public var leadingIndicator:Float = 0
    public var selectedTabPosition:SelectedTabPosition = .center
    
    init(rightSeparatorColor: UIColor = UIColor(red: 148.0/255.0, green: 148.0/255.0, blue: 148.0/255.0, alpha: 1.0),
         titleColor: UIColor = UIColor(red: 148.0/255.0, green: 148.0/255.0, blue: 148.0/255.0, alpha: 1.0),
         font:UIFont = UIFont(name: "HelveticaNeue-Light", size: 14)!,
         highlightedFont:UIFont = UIFont(name: "HelveticaNeue-Medium", size: 15)!,
         highlightedColor: UIColor = UIColor(red: 52.0/255.0, green: 179.0/255.0, blue: 231.0/255.0, alpha: 1.0),
         highlightedTitleColor: UIColor = UIColor(red: 52.0/255.0, green: 179.0/255.0, blue: 231.0/255.0, alpha: 1.0), pageTitleBounds:OPageTitleBounds = .fixed,
         titleItemWidth:Float = Float.greatestFiniteMagnitude,
         titleItemHeight:Float = 50,
         indicatorWidthRatio:Float = 1,
         leftSeparatorColor: UIColor = UIColor(red: 148.0/255.0, green: 148.0/255.0, blue: 148.0/255.0, alpha: 1.0),
         bottomSeparatorColor: UIColor = UIColor(red: 148.0/255.0, green: 148.0/255.0, blue: 148.0/255.0, alpha: 1.0),
         textAlignment:NSTextAlignment = .center,
         flexibleTitleWidth:Bool = false,
         minimumTitleItemWidth:Float = 0,
         paddingTitle:Float = 0,
         leadingIndicator:Float = 0,
         selectedTabPosition:SelectedTabPosition = .center) {
        self.rightSeparatorColor = rightSeparatorColor
        self.leftSeparatorColor = leftSeparatorColor
        self.bottomSeparatorColor = bottomSeparatorColor
        self.titleColor = titleColor
        self.font = font
        self.highlightedFont = highlightedFont
        self.highlightedColor = highlightedColor
        self.highlightedTitleColor = highlightedTitleColor
        self.pageTitleBounds = pageTitleBounds
        self.titleItemWidth = titleItemWidth
        self.titleItemHeight = titleItemHeight
        self.indicatorWidthRatio = indicatorWidthRatio
        self.textAlignment = textAlignment
        self.flexibleTitleWidth = flexibleTitleWidth
        self.minimumTitleItemWidth = minimumTitleItemWidth
        self.paddingTitle = paddingTitle
        self.leadingIndicator = leadingIndicator
        self.selectedTabPosition = selectedTabPosition
    }
}
