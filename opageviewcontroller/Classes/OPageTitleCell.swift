//
//  OPageTitleCell.swift
//  PageViewControllerProject
//
//  Created by Abhishek Singh on 28/06/17.
//  Copyright © 2017 Abhishek Singh. All rights reserved.
//

import UIKit

struct OPageViewTitlesData {
    
    let hideBottomSeparator: Bool
    let hideRightSeparator: Bool
    let hideLeftSeparator: Bool
    let isSelected:Bool
    let titleColor:UIColor
    let titleFont:UIFont
    let indicatorColor:UIColor
    let title:String
    let model : AnyObject?
    let constraintTrailingIndicator:Float
    let rightSeparatorColor:UIColor
    let leftSeparatorColor:UIColor
    let bottomSeparatorColor:UIColor
    
    init(hideBottomSeparator: Bool,
         hideRightSeparator: Bool,
         hideLeftSeparator: Bool,
         isSelected:Bool,
         titleColor:UIColor,
         titleFont:UIFont,
         indicatorColor:UIColor,
         title:String,
         model : AnyObject?,
         constraintTrailingIndicator:Float = 0,
         rightSeparatorColor:UIColor,
         leftSeparatorColor:UIColor,
         bottomSeparatorColor:UIColor) {
        self.hideBottomSeparator = hideBottomSeparator
        self.hideRightSeparator = hideRightSeparator
        self.hideLeftSeparator = hideLeftSeparator
        self.isSelected = isSelected
        self.titleColor = titleColor
        self.titleFont = titleFont
        self.indicatorColor = indicatorColor
        self.title = title
        self.model = model
        self.constraintTrailingIndicator = constraintTrailingIndicator
        self.rightSeparatorColor = rightSeparatorColor
        self.leftSeparatorColor = leftSeparatorColor
        self.bottomSeparatorColor = bottomSeparatorColor
    }
}

class OPageTitleCell: UICollectionViewCell {
    @IBOutlet weak var selectedIndicatorV: UIView!
    @IBOutlet weak var bottomSeparator: UIView!
    @IBOutlet weak var leftSeparator: UIView!
    @IBOutlet weak var rightSeparator: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var constraintTrailingIndicator: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    private func setupCell(){
    }
    
    public func configureWithData(_ data:OPageViewTitlesData) {
        constraintTrailingIndicator.constant = CGFloat(data.constraintTrailingIndicator)
        bottomSeparator.isHidden = data.hideBottomSeparator
        bottomSeparator.backgroundColor = data.bottomSeparatorColor
        rightSeparator.isHidden = data.hideRightSeparator
        rightSeparator.backgroundColor = data.rightSeparatorColor
        leftSeparator.isHidden = data.hideLeftSeparator
        leftSeparator.backgroundColor = data.leftSeparatorColor
        selectedIndicatorV.isHidden = !data.isSelected
        selectedIndicatorV.backgroundColor = data.indicatorColor
        lblTitle.text = data.title
        lblTitle.textColor = data.titleColor
        lblTitle.font = data.titleFont
    }
}
