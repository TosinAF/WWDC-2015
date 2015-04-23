//
//  OnboardingViewController.swift
//  HopperBus
//
//  Created by Tosin Afolabi on 16/12/2014.
//  Copyright (c) 2014 Tosin Afolabi. All rights reserved.
//

import UIKit
import Cartography

enum AboutType: Int {

    case A1 = 0, A2, A3, A4, A5, A6, A7, A8

}

class AboutViewController: UIViewController {
    
    // MARK: Properties
    
    var currentIndex = 0
    
    lazy var pageViewController: UIPageViewController = {
        let pageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        pageViewController.delegate = self
        pageViewController.dataSource = self
        let vc: UIViewController = A1ViewController()
        pageViewController.setViewControllers([vc], direction:  UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
        return pageViewController
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 8
        pageControl.pageIndicatorTintColor = UIColor(red:0.204, green:0.286, blue:0.369, alpha: 1)
        pageControl.currentPageIndicatorTintColor = UIColor(red:0.424, green:0.478, blue:0.537, alpha: 1)
        pageControl.setTranslatesAutoresizingMaskIntoConstraints(false)
        return pageControl
    }()
    
    var vcs = [A0ViewController]()
    
    // MARK: - Initializers
    
    init() {
        super.init(nibName: nil, bundle: nil)
        vcs = [A1ViewController(), A2ViewController(), A3ViewController(), A4ViewController(),
                A5ViewController(), A6ViewController(), A7ViewController(), A8ViewController()]
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: View Lifecycle
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //self.navigationController?.navigationBarHidden = true
        //navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        edgesForExtendedLayout = .None
        println(view.frame)
        
        
        pageViewController.didMoveToParentViewController(self)
        addChildViewController(pageViewController)
        pageViewController.view.frame = view.frame
        view.addSubview(pageViewController.view)
        view.addSubview(pageControl)
        
        layout(pageControl) { pageControl in
            pageControl.bottom == pageControl.superview!.bottom - 10
            pageControl.centerX == pageControl.superview!.centerX
        }
        
    }
}


// MARK: - UIPageViewController DataSource & Delegate

extension AboutViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! A0ViewController
        
        switch vc.type {
            
        case .A1:
            return nil
        case .A2:
            return vcs[0]
        case .A3:
            return vcs[1]
        case .A4:
            return vcs[2]
        case .A5:
            return vcs[3]
        case .A6:
            return vcs[4]
        case .A7:
            return vcs[5]
        case .A8:
            return vcs[6]
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        let vc = viewController as! A0ViewController
        
        switch vc.type {
            
        case .A1:
            return vcs[1]
        case .A2:
            return vcs[2]
        case .A3:
            return vcs[3]
        case .A4:
            return vcs[4]
        case .A5:
            return vcs[5]
        case .A6:
            return vcs[6]
        case .A7:
            return vcs[7]
        case .A8:
            return nil
        }
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [AnyObject], transitionCompleted completed: Bool) {
        if completed { pageControl.currentPage = currentIndex }
    }
    
    func pageViewController(pageViewController: UIPageViewController, willTransitionToViewControllers pendingViewControllers: [AnyObject]) {
        let previousVC = pendingViewControllers.first as! A0ViewController
        
        switch previousVC.type {
            
        case .A1:
            currentIndex = 0
        case .A2:
            currentIndex = 1
        case .A3:
            currentIndex = 2
        case .A4:
            currentIndex = 3
        case .A5:
            currentIndex = 4
        case .A6:
            currentIndex = 5
        case .A7:
            currentIndex = 6
        case .A8:
            currentIndex = 7
            
        }
    }
}