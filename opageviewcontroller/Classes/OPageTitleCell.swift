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
    let textAlignment:NSTextAlignment
    let leadingIndicator:CGFloat
    let paddingTitle:CGFloat
    
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
         bottomSeparatorColor:UIColor,
         textAlignment:NSTextAlignment,
         leadingIndicator:CGFloat = 0,
         paddingTitle:CGFloat = 0) {
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
        self.textAlignment = textAlignment
        self.leadingIndicator = leadingIndicator
        self.paddingTitle = paddingTitle
    }
}

class OPageTitleCell: UICollectionViewCell {
    @IBOutlet weak var selectedIndicatorV: UIView!
    @IBOutlet weak var bottomSeparator: UIView!
    @IBOutlet weak var leftSeparator: UIView!
    @IBOutlet weak var rightSeparator: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var constraintTrailingIndicator: NSLayoutConstraint!
    @IBOutlet weak var constraintLeadingTitle: NSLayoutConstraint!
    @IBOutlet weak var constraintTrailingTitle: NSLayoutConstraint!
    @IBOutlet weak var constraintBottomSeparatorLeading: NSLayoutConstraint!
    @IBOutlet weak var constraintLeadingIndicator: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    private func setupCell(){
        constraintLeadingTitle.constant = 20
        constraintTrailingTitle.constant = 20
    }
    
    public func configureWithData(_ data:OPageViewTitlesData) {
        constraintTrailingIndicator.constant = CGFloat(data.constraintTrailingIndicator)
        constraintLeadingTitle.constant = data.paddingTitle
        constraintTrailingTitle.constant = data.paddingTitle
        constraintLeadingIndicator.constant = data.leadingIndicator
        bottomSeparator.isHidden = data.hideBottomSeparator
        bottomSeparator.backgroundColor = data.bottomSeparatorColor
        rightSeparator.isHidden = data.hideRightSeparator
        rightSeparator.backgroundColor = data.rightSeparatorColor
        leftSeparator.isHidden = data.hideLeftSeparator
        leftSeparator.backgroundColor = data.leftSeparatorColor
        selectedIndicatorV.isHidden = !data.isSelected
        selectedIndicatorV.backgroundColor = data.indicatorColor
        lblTitle.textAlignment = data.textAlignment
        lblTitle.text = data.title
        lblTitle.textColor = data.titleColor
        lblTitle.font = data.titleFont
    }
}
