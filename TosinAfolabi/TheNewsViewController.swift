//
//  OnboardingViewController.swift
//  HopperBus
//
//  Created by Tosin Afolabi on 16/12/2014.
//  Copyright (c) 2014 Tosin Afolabi. All rights reserved.
//

import UIKit
import pop

// MARK: - Onboarding View Controller

class TheNewsViewController: UIViewController {
    
    // MARK: Properties
    
    let contentVCS: [TheNewsContentType: TheNewsContentController]
    
    var currentIndex = 0
    
    lazy var pageViewController: UIPageViewController = {
        let pageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        pageViewController.delegate = self
        pageViewController.dataSource = self
        let vc: UIViewController = self.contentVCS[.Route]!
        pageViewController.setViewControllers([vc], direction:  UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
        return pageViewController
        }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages =  TheNewsContentType.allTypes.count
        pageControl.pageIndicatorTintColor = UIColor(red:0.157, green:0.392, blue:0.494, alpha: 1)
        pageControl.currentPageIndicatorTintColor = UIColor(red:0.392, green:0.871, blue:0.733, alpha: 1)
        pageControl.setTranslatesAutoresizingMaskIntoConstraints(false)
        return pageControl
        }()
    
    lazy var continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("THE NEWS", forState: .Normal)
        button.setTitleColor(UIColor(red:0.157, green:0.392, blue:0.494, alpha: 1), forState: .Normal)
        button.titleLabel!.font = UIFont(name: "Montserrat-Regular", size: 18.0)
        button.setTranslatesAutoresizingMaskIntoConstraints(false)
        return button
        }()
    
    // MARK: - Initializers
    
    init() {
        
        var contentVCS = [TheNewsContentType: TheNewsContentController]()
        
        for type in TheNewsContentType.allTypes {
            let vc = TheNewsContentController(type: type)
            contentVCS[type] = vc
        }
        
        self.contentVCS = contentVCS
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: View Lifecycle
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.sharedApplication().setStatusBarHidden(true, withAnimation: .None)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        
        let backgroundView = UIImageView(image: UIImage(named: "BG4"))
        backgroundView.frame = view.frame
        view.addSubview(backgroundView)
        
        pageViewController.didMoveToParentViewController(self)
        addChildViewController(pageViewController)
        pageViewController.view.frame = view.frame
        view.addSubview(pageViewController.view)
        
        layoutSubviews()
        
        // Set Scrollview Delegate
        for view in self.pageViewController.view.subviews {
            if let sv = view as? UIScrollView  {
                sv.delegate = self
            }
        }
    }
    
    // MARK: - Actions
    
    func continueButtonClicked() {
    }
    
    // MARK: - Utility Functions
    
    func layoutSubviews() {
        
        let bottomView = UIView()
        bottomView.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.7)
        bottomView.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        view.addSubview(bottomView)
        view.addSubview(pageControl)
        view.addSubview(continueButton)
        
        let views = [
            "bottomView": bottomView,
            "pageControl": pageControl,
            "button": continueButton
            
        ]
        
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|[bottomView]|", options: nil, metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[bottomView(60)]|", options: nil, metrics: nil, views: views))
        
        view.addConstraint(NSLayoutConstraint(item: pageControl, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: pageControl, attribute: .CenterY, relatedBy: .Equal, toItem: bottomView, attribute: .CenterY, multiplier: 1.0, constant: 10.0))
        
        view.addConstraint(NSLayoutConstraint(item: continueButton, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: continueButton, attribute: .CenterY, relatedBy: .Equal, toItem: bottomView, attribute: .CenterY, multiplier: 1.0, constant: -10.0))
    }
}


// MARK: - UIPageViewController DataSource & Delegate

extension TheNewsViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! TheNewsContentController
        
        switch vc.type {
            
        case .Route:
            return nil
        case .RealTime:
            return contentVCS[.Route]
        case .RouteTimes:
            return contentVCS[.RealTime]
        case .Map:
            return contentVCS[.RouteTimes]
            
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! TheNewsContentController
        
        switch vc.type {
            
        case .Route:
            return contentVCS[.RealTime]
        case .RealTime:
            return contentVCS[.RouteTimes]
        case .RouteTimes:
            return contentVCS[.Map]
        case .Map:
            return nil
            
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [AnyObject], transitionCompleted completed: Bool) {
        if completed { pageControl.currentPage = currentIndex }
    }
    
    func pageViewController(pageViewController: UIPageViewController, willTransitionToViewControllers pendingViewControllers: [AnyObject]) {
        let previousVC = pendingViewControllers.first as! TheNewsContentController
        
        switch previousVC.type {
            
        case .Route:
            currentIndex = 0
        case .RealTime:
            currentIndex = 1
        case .RouteTimes:
            currentIndex = 2
        case .Map:
            currentIndex = 3
            
        }
    }
}

// MARK: - UIScrollView Delegate

extension TheNewsViewController: UIScrollViewDelegate {
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        setPageView(alpha: 0.7)
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        setPageView(alpha: 1.0)
    }
    
    private func setPageView(alpha alphaVal: CGFloat) {
        
        var alphaAnim: POPBasicAnimation? = pageViewController.view.pop_animationForKey("alpha") as? POPBasicAnimation
        
        if let a = alphaAnim {
            alphaAnim!.toValue = alphaVal
        } else {
            alphaAnim = POPBasicAnimation(propertyNamed: kPOPViewAlpha)
            alphaAnim!.toValue = alphaVal
        }
        
        alphaAnim!.duration = 0.15
        pageViewController.view.pop_addAnimation(alphaAnim, forKey: "alpha")
    }
}