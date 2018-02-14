//
//  OPageViewTitles.swift
//  PageViewControllerProject
//
//  Created by Abhishek Singh on 27/06/17.
//  Copyright © 2017 Abhishek Singh. All rights reserved.
//

import UIKit

protocol OPageViewTitlesDelegate:class {
    func didSelectTitleAtIndexPath(_ indexPath:IndexPath, orderAscending:Bool)
}

class OPageViewTitles: UICollectionView {
    
    fileprivate static let kTitleCellIdentifier:String = "OPageTitleCell"
    fileprivate var selectedIndex:Int = 0
    fileprivate let padding:CGFloat = 15.0
    
    public var pages:[OPage] = [OPage](){
        didSet{
            self.reloadData()
        }
    }
    public weak var customDelegate:OPageViewTitlesDelegate?
    public var uiConfig:OPageViewTitleUI = OPageViewTitleUI(){
        didSet{
            self.isScrollEnabled = beyondBoundsMode()
//            if let flowLayout:UICollectionViewFlowLayout = self.collectionViewLayout as? UICollectionViewFlowLayout {
//                if #available(iOS 10.0, *) {
//                    flowLayout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize
//                }
//            }
        }
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView(){
        registerCells()
        
        self.delegate = self
        self.dataSource = self
        self.showsHorizontalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
    }
    
    private func registerCells(){
        self.register(UINib.init(nibName: "OPageTitleCell", bundle: Bundle(for: OPageViewTitles.classForCoder())), forCellWithReuseIdentifier: OPageViewTitles.kTitleCellIdentifier)
    }
    
    fileprivate func getItemSizeFromNumber(of items:Int, indexPath:IndexPath) -> CGSize{
        var itemSize:CGSize = CGSize.zero
        if beyondBoundsMode() == true{
            
            let width:Float = uiConfig.titleItemWidth
            let height:Float = uiConfig.titleItemHeight
            
            if uiConfig.flexibleTitleWidth == true {
                var titleSize:CGSize = CGSize.zero
                if selectedIndex == indexPath.item {
                    titleSize = (((pages[indexPath.item]).title) as NSString).size(withAttributes: [NSAttributedStringKey.font: uiConfig.highlightedFont])
                }else {
                    titleSize = (((pages[indexPath.item]).title) as NSString).size(withAttributes: [NSAttributedStringKey.font: uiConfig.font])
                }
                itemSize = CGSize(width: titleSize.width + padding, height: CGFloat(height))
            }else{
                itemSize = CGSize(width: CGFloat(width), height: CGFloat(height))
            }
        }else{
            itemSize = defaultItemSize(for: items)
        }
        
        if uiConfig.minimumTitleItemWidth > 0 && itemSize.width < CGFloat(uiConfig.minimumTitleItemWidth) {
            itemSize.width = CGFloat(uiConfig.minimumTitleItemWidth)
        }
        
        itemSize.width = CGFloat(floorf(Float(itemSize.width))) + ( 2 * CGFloat(uiConfig.paddingTitle) )
        
        return itemSize
    }
    
    public func selectIndex(at index:Int){
        self.collectionView(self, didSelectItemAt: IndexPath(item: index, section: 0))
    }
    
    fileprivate func defaultItemSize(for items:Int) -> CGSize {
        return CGSize(width:self.bounds.width / CGFloat(items), height:self.bounds.height)
    }
        
    fileprivate func beyondBoundsMode() -> Bool {
        return uiConfig.pageTitleBounds == .stretchable
    }
    
    fileprivate func scrollPosition(_ selectedTabPosition:SelectedTabPosition) -> UICollectionViewScrollPosition {
        switch selectedTabPosition {
        case .center:
            return UICollectionViewScrollPosition.centeredHorizontally
        case .left:
            return UICollectionViewScrollPosition.left
        case .right:
            return UICollectionViewScrollPosition.right
        }
    }
}

extension OPageViewTitles: UICollectionViewDataSource{
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return pages.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell:OPageTitleCell = collectionView.dequeueReusableCell(withReuseIdentifier: OPageViewTitles.kTitleCellIdentifier, for: indexPath) as! OPageTitleCell
        
        let page:OPage = pages[indexPath.item]
        
        let _isSelected:Bool = (indexPath.item == selectedIndex)
        let _hideBottomSeparator:Bool = _isSelected
        let _hideRightSeparator:Bool = true
        let _hideLeftSeparator:Bool = (indexPath.item == 0)
        
        var _uiConfig:OPageViewTitleUI = self.uiConfig
        if let pageSpecUIConfig:OPageViewTitleUI = page.uiConfig {
            _uiConfig = pageSpecUIConfig
        }
        
        let _titleColor:UIColor = _isSelected ? _uiConfig.highlightedTitleColor :_uiConfig.titleColor
        let _titleFont:UIFont = _isSelected ? _uiConfig.highlightedFont :_uiConfig.font
        let _indicatorColor:UIColor = _isSelected ? _uiConfig.highlightedColor :_uiConfig.titleColor
        let _rightSeparatorColor:UIColor = _uiConfig.rightSeparatorColor
        let _leftSeparatorColor:UIColor = _uiConfig.leftSeparatorColor
        let _bottomSeparatorColor:UIColor = _uiConfig.bottomSeparatorColor
        let _textAlignment:NSTextAlignment = _uiConfig.textAlignment
        let selectedIndicatorFactor:Float = (_uiConfig.indicatorWidthRatio <= 0 || _uiConfig.indicatorWidthRatio == 1 || _uiConfig.indicatorWidthRatio > 1) ? 0 : _uiConfig.indicatorWidthRatio
        let itemSize:CGSize = getItemSizeFromNumber(of: pages.count, indexPath: indexPath)
        let indicatorWidth:Float = floorf(Float(itemSize.width) * selectedIndicatorFactor)
        let _leadingIndicator:CGFloat = CGFloat(_uiConfig.leadingIndicator)
        let _paddingTitle:CGFloat = CGFloat(_uiConfig.paddingTitle)
        
        cell.configureWithData(
            OPageViewTitlesData(
            hideBottomSeparator: _hideBottomSeparator,
            hideRightSeparator: _hideRightSeparator,
            hideLeftSeparator: _hideLeftSeparator,
            isSelected:_isSelected,
            titleColor:_titleColor,
            titleFont:_titleFont,
            indicatorColor: _indicatorColor,
            title:page.title,
            model : page,
            rightSeparatorColor:_rightSeparatorColor,
            leftSeparatorColor:_leftSeparatorColor,
            bottomSeparatorColor:_bottomSeparatorColor,
            textAlignment:_textAlignment,
            leadingIndicator:_leadingIndicator,
            paddingTitle:_paddingTitle,
            constraintWidthIndicator:indicatorWidth)
        )
        return cell
    }
}

extension OPageViewTitles: UICollectionViewDelegate{
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        if indexPath.item != selectedIndex {
            let prevSelectedIndex:Int = selectedIndex
            selectedIndex = indexPath.item
            self.reloadItems(at: [IndexPath.init(item: prevSelectedIndex, section: 0), IndexPath.init(item: selectedIndex, section: 0)])
            
            if let _delegate = customDelegate {
                _delegate.didSelectTitleAtIndexPath(indexPath, orderAscending:selectedIndex > prevSelectedIndex)
                if beyondBoundsMode() == true {
                    collectionView.scrollToItem(at: indexPath, at: scrollPosition(uiConfig.selectedTabPosition), animated: true)
                }
            }
        }
    }
}

extension OPageViewTitles: UICollectionViewDelegateFlowLayout{
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
    return self.getItemSizeFromNumber(of: pages.count, indexPath: indexPath)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        return 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        return 0
    }
}
