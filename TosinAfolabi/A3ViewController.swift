//
//  ViewController.swift
//  TosinAfolabi
//
//  Created by Tosin Afolabi on 4/21/15.
//  Copyright (c) 2015 Tosin Afolabi. All rights reserved.
//

import UIKit
import Cartography
import JTHamburgerButton

class A3ViewController: A0ViewController {
    
    let labelCount: Int = 4
    var labels = [String:UIView]()
    
    lazy var imageView: UIImageView = {
        let image = UIImage(named: "Point.png")
        let imageView = UIImageView(image: image)
        imageView.setTranslatesAutoresizingMaskIntoConstraints(false)
        return imageView
    }()
    
    lazy var imageView2: UIImageView = {
        let image = UIImage(named: "NottsUni.png")
        let imageView = UIImageView(image: image)
        imageView.setTranslatesAutoresizingMaskIntoConstraints(false)
        return imageView
    }()
    
    lazy var menuToggle: JTHamburgerButton = {
        let toggle = JTHamburgerButton(frame: CGRectMake(self.view.frame.width - 80, 60, 40, 40))
        toggle.lineColor = UIColor(red:0.204, green:0.286, blue:0.369, alpha: 1)
        toggle.lineWidth = 38.0
        toggle.lineHeight = 2.5
        toggle.lineSpacing = 10.0
        toggle.updateAppearance()
        return toggle
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        type = .A3
        
        let l1 = AboutSectionLabel()
        l1.text = "I WORK AT"
        l1.font = UIFont(name: "Montserrat-Regular", size: 40.0)
        l1.textColor = UIColor(red:0.204, green:0.286, blue:0.369, alpha: 1)
        
        let l2 = AboutSectionLabel()
        l2.text = "POINT"
        l2.font = UIFont(name: "Montserrat-Regular", size: 40.0)
        l2.textColor = UIColor(red:0.827, green:0.353, blue:0.161, alpha: 1)
        
        let l3 = AboutSectionLabel()
        l3.text = "AND STUDY AT"
        l3.font = UIFont(name: "Montserrat-Regular", size: 40.0)
        l3.textColor = UIColor(red:0.204, green:0.286, blue:0.369, alpha: 1)
        
        let l4 = AboutSectionLabel()
        l4.text = "NOTTINGHAM"
        l4.font = UIFont(name: "Montserrat-Regular", size: 40.0)
        l4.textColor = UIColor(red:0.000, green:0.494, blue:0.651, alpha: 1)
        
        let l5 = AboutSectionLabel()
        l5.text = "UNIVERSITY"
        l5.font = UIFont(name: "Montserrat-Regular", size: 40.0)
        l5.textColor = UIColor(red:0.000, green:0.494, blue:0.651, alpha: 1)
        
        view.addSubview(l1)
        view.addSubview(l2)
        view.addSubview(l3)
        view.addSubview(l4)
        view.addSubview(l5)
        view.addSubview(imageView)
        view.addSubview(imageView2)
        view.addSubview(menuToggle)
        
        menuToggle.addTarget(self, action: "togglePressed:", forControlEvents: .TouchUpInside)
        
        labels = [
            "l1":l1,
            "l2":l2,
            "l3":l3,
            "l4":l4,
            "l5":l5
        ]
        
        layoutSubviews()
        view.layoutIfNeeded()
        menuToggle.center.y = imageView.center.y
    }
    
    func togglePressed(sender: JTHamburgerButton) {
        
        NSNotificationCenter.defaultCenter().postNotificationName("menuButtonClicked", object: nil)
        
        if sender.currentMode == .Hamburger {
            sender.setCurrentModeWithAnimation(.Cross)
        } else if sender.currentMode == .Cross {
            sender.setCurrentModeWithAnimation(.Hamburger)
        }
    }
    
    
    func layoutSubviews() {
        
        let views = labels
        
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|-30-[l1]", options: nil, metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|-30-[l2]", options: nil, metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|-30-[l3]", options: nil, metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|-30-[l4]", options: nil, metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|-30-[l5]", options: nil, metrics: nil, views: views))

        
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[l1][l2][l3][l4][l5]-50-|", options: nil, metrics: nil, views: views))
        
        layout(imageView) { imageView in
            imageView.width == 60
            imageView.height == 60
            imageView.left == imageView.superview!.left + 30
            imageView.top == imageView.superview!.top + 48
        }
        
        layout(imageView, imageView2) { iv, imageView in
            imageView.width == 40
            imageView.height == 60
            imageView.left == iv.right + 30
            imageView.top == imageView.superview!.top + 48
        }
    }
}

