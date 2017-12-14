//
//  OPageViewController.swift
//  PageViewControllerProject
//
//  Created by Abhishek Singh on 27/06/17.
//  Copyright © 2017 Abhishek Singh. All rights reserved.
//

import UIKit

public enum OPageViewControllerType {
    case linear
    case cyclic
}

public protocol OPageViewControllerDelegate:class {
    func OPageVC(_ oPageVC:OPageViewController, didSelectItemAt index:Int, page:OPage)
}

public enum OPageTitleBounds {
    /* Description: The Title View width is same as parent View Controller.
     Width is equally devided between items. */
    case fixed
    
    /* Description: The Title View can stretch beyond View Controller's bound
     on the right. Width is configurable */
    case stretchable
}

open class OPageViewController: UIViewController {

    private var pageVC:UIPageViewController?
    fileprivate var titlesView:OPageViewTitles?
    fileprivate(set) public var currentPage:Int = 0
    
    public var pages:[OPage] = [OPage]()
    public var pageType:OPageViewControllerType = .cyclic
    public var uiConfig:OPageViewTitleUI = OPageViewTitleUI()
    public weak var delegate:OPageViewControllerDelegate?

    override open func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    public init(pageTitleBounds:OPageTitleBounds = .fixed, titleItemWidth:Float = 90, titleItemHeight:Float = 50, indicatorWidthRatio:Float = 1) {
        uiConfig.pageTitleBounds = pageTitleBounds
        uiConfig.titleItemWidth = titleItemWidth
        uiConfig.titleItemHeight = titleItemHeight
        uiConfig.indicatorWidthRatio = indicatorWidthRatio
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func invalidate() {
        setupView()
    }
    
    private func setupView(){
        if pages.count > 0 {
            self.edgesForExtendedLayout = [];
            self.view.backgroundColor = UIColor.white
            
            layoutTitleView()
            layoutPages()
        }
    }
    
    private func layoutTitleView(){
        titlesView = Bundle(for: OPageViewTitles.classForCoder()).loadNibNamed("OPageViewTitles", owner: self, options: nil)?.first as? OPageViewTitles
        titlesView!.translatesAutoresizingMaskIntoConstraints = false
        titlesView!.pages = pages
        titlesView!.uiConfig = uiConfig
        titlesView!.customDelegate = self
        self.view.addSubview(titlesView!)
        
        let hConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[titlesView]-0-|", options: [], metrics: nil, views: ["titlesView":titlesView!])
        let titleViewHeightConstraintStr = String(format: "V:|-0-[titlesView(%lf)]", uiConfig.titleItemHeight)
        let vConstraints = NSLayoutConstraint.constraints(withVisualFormat: titleViewHeightConstraintStr, options: [], metrics: nil, views: ["titlesView":titlesView!])
        
        let allConstraints = hConstraints + vConstraints
        NSLayoutConstraint.activate(allConstraints)
    }
    
    private func layoutPages(){
        pageVC = UIPageViewController.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageVC!.delegate = self
        pageVC!.dataSource = self
        self.addChildViewController(pageVC!)
        self.view.addSubview(pageVC!.view)
        self.pageVC!.didMove(toParentViewController: self)
        
        pageVC!.view.translatesAutoresizingMaskIntoConstraints = false
        
        let hConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[pageVC]-0-|", options: [], metrics: nil, views: ["pageVC":pageVC!.view])
        let vConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[titlesView]-0-[pageVC]-0-|", options: [], metrics: nil, views: ["pageVC":pageVC!.view, "titlesView":titlesView!])
        
        let allConstraints = hConstraints + vConstraints
        NSLayoutConstraint.activate(allConstraints)
        
        // Add Default View Controllers
        showPage(pages.first!, ascending: true)
    }
    
    fileprivate func viewControllerAtPage(_ page:Int) -> UIViewController?{
        if page < pages.count && page >= 0 {
            return pages[page].viewController
        }
        return nil
    }
    
    fileprivate func indexOfViewController(_ viewController:UIViewController) -> Int?{
        var index:Int = -1
        var count:Int = 0
        
        for page in pages {
            if page.viewController == viewController {
                index = count
                break
            }
            count += 1
        }
        return index
    }
    
    fileprivate func showPage(_ page:OPage, ascending:Bool){
        var _direction:UIPageViewControllerNavigationDirection = .forward
        if ascending == false {
            _direction = .reverse
        }
        if pages.count > 0 {
            pageVC!.setViewControllers([page.viewController], direction: _direction, animated: true, completion: nil)
        }
    }
    
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension OPageViewController: UIPageViewControllerDelegate{
    public func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool){
        if finished && completed {
            let index:Int = indexOfViewController((pageViewController.viewControllers?.first)!)!
            if index > -1 {
                self.currentPage = index
                self.titlesView?.selectIndex(at: index)
                if let _delegate = delegate {
                    _delegate.OPageVC(self, didSelectItemAt: index, page:pages[index])
                }
            }
        }
    }
}

extension OPageViewController: UIPageViewControllerDataSource{
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?{
        guard let vcIndex = indexOfViewController(viewController) else { return nil }
        let prevIndex:Int = vcIndex - 1
        if prevIndex < 0 && pageType == .cyclic {
            return viewControllerAtPage(pages.count - 1)
        }
        return viewControllerAtPage(prevIndex)
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?{
        guard let vcIndex = indexOfViewController(viewController) else { return nil }
        var nextIndex = vcIndex + 1
        if nextIndex >= pages.count && pageType == .cyclic {
            nextIndex = 0
        }
        return viewControllerAtPage(nextIndex)
    }
}

extension OPageViewController:OPageViewTitlesDelegate {
    func didSelectTitleAtIndexPath(_ indexPath:IndexPath, orderAscending:Bool){
        if indexPath.item >= 0 && indexPath.item < pages.count{
            self.currentPage = indexPath.item
            showPage(pages[indexPath.item], ascending: orderAscending)
            if let _delegate = delegate {
                _delegate.OPageVC(self, didSelectItemAt: indexPath.item, page:pages[indexPath.item])
            }
        }
    }
}

extension OPageViewControllerDelegate{
    func OPageVC(_ oPageVC:OPageViewController, didSelectItemAt index:Int,  page:OPage){
    }
}
