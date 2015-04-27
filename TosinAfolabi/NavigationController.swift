//
//  HomeViewController.swift
//  TosinAfolabi
//
//  Created by Tosin Afolabi on 4/22/15.
//  Copyright (c) 2015 Tosin Afolabi. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController, UINavigationControllerDelegate {
    
    var showMediumMenu:() -> () = {}
    
    weak var navDelegate: UINavigationControllerDelegate?
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SimpleAnimationController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //delegate = NavControllerDelegate()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "showMenu", name:"menuButtonClicked", object: nil)
        navDelegate = NavControllerDelegate()
        delegate = self
        
        //UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        setViewControllers([AboutViewController()], animated: false)
        
        UIApplication.sharedApplication().setStatusBarHidden(true, withAnimation: .None)
        
        navigationBarHidden = true
        
        let item1: MediumMenuItem = MediumMenuItem(menuItemWithTitle: "About Me", withCompletionHandler: {(finished: Bool) -> () in
            self.pushViewController(AboutViewController(), animated: true)
        } )
        
        let item2: MediumMenuItem = MediumMenuItem(menuItemWithTitle: "Hopper Bus", withCompletionHandler: {(finished: Bool) -> () in
            self.pushViewController(HopperBusViewController(), animated: true)
        })
        
        let item3: MediumMenuItem = MediumMenuItem(menuItemWithTitle: "The News", withCompletionHandler: {(finished: Bool) -> () in
            self.pushViewController(TheNewsViewController(), animated: true)
        })
        
        let item4: MediumMenuItem = MediumMenuItem(menuItemWithTitle: "Bricks", withCompletionHandler: {(finished: Bool) -> () in
            self.pushViewController(BricksViewController(), animated: true)
        })
        
        let item5: MediumMenuItem = MediumMenuItem(menuItemWithTitle: "Slang", withCompletionHandler: {(finished: Bool) -> () in
            self.pushViewController(SlangViewController(), animated: true)
        })
        
        let item6: MediumMenuItem = MediumMenuItem(menuItemWithTitle: "Procuses", withCompletionHandler: {(finished: Bool) -> () in
            self.pushViewController(ProcusesViewController(), animated: true)
        })
        
        let menu = MediumMenu(Items: [item1, item2, item3, item4, item5, item6], andTextAlignment: .Left, forViewController: self)
        showMediumMenu = {
            menu.showMenu()
        }
    }
    
    func showMenu() {
        showMediumMenu()
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "menuButtonClicked", object: nil)
    }
}

extension UINavigationBar {
    public override func sizeThatFits(size: CGSize) -> CGSize {
        var newsize: CGSize = CGSizeMake(UIScreen.mainScreen().bounds.size.width, 60)
        return newsize
    }
}

class SimpleAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.35
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        transitionContext.containerView().addSubview(toViewController.view)
        toViewController.view.alpha = 0.0
        UIView.animateWithDuration(0.35, animations: {
            toViewController.view.alpha = 1.0
            fromViewController!.view.alpha = 1.0
            }, completion: { (finished) in
                transitionContext.completeTransition(true)
        })
    }
}

class NavControllerDelegate: NSObject, UINavigationControllerDelegate {
    
    func navigationController(navigationController: UINavigationController,
        animationControllerForOperation operation: UINavigationControllerOperation,
        fromViewController fromVC: UIViewController,
        toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        println("i get called")
        return SimpleAnimationController()
    }

}
