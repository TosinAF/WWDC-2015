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

class A2ViewController: A0ViewController {
    
    let labelCount: Int = 4
    var labels = [String:UIView]()
    
    lazy var menuToggle: JTHamburgerButton = {
        let toggle = JTHamburgerButton(frame: CGRectMake(self.view.frame.width - 80, 60, 40, 40))
        toggle.lineColor = UIColor(red:0.204, green:0.286, blue:0.369, alpha: 1)
        toggle.lineWidth = 38.0
        toggle.lineHeight = 2.5
        toggle.lineSpacing = 10.0
        toggle.updateAppearance()
        return toggle
    }()
    
    lazy var iconLabel: UILabel = {
        let label = UILabel()
        label.text = "\u{E655}"
        label.font = UIFont(name: "devicons", size: 60.0)
        label.textColor = UIColor(red:0.204, green:0.286, blue:0.369, alpha: 1)
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        return label
    }()
    
    lazy var iconLabel2: UILabel = {
        let label = UILabel()
        label.text = "\u{E618}"
        label.font = UIFont(name: "devicons", size: 60.0)
        label.textColor = UIColor(red:0.204, green:0.286, blue:0.369, alpha: 1)
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        return label
    }()
    
    lazy var iconLabel3: UILabel = {
        let label = UILabel()
        label.text = "\u{E61B}"
        label.font = UIFont(name: "devicons", size: 60.0)
        label.textColor = UIColor(red:0.204, green:0.286, blue:0.369, alpha: 1)
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        type = .A2
        
        let l1 = AboutSectionLabel()
        l1.text = "I'M A"
        l1.textColor = UIColor(red:0.204, green:0.286, blue:0.369, alpha: 1)
        
        let l2 = AboutSectionLabel()
        l2.text = "FULL TIME"
        l2.textColor = UIColor(red:0.204, green:0.286, blue:0.369, alpha: 1)
        
        let l3 = AboutSectionLabel()
        l3.text = "iOS & WEB"
        l3.textColor = UIColor(red:0.753, green:0.224, blue:0.169, alpha: 1)
        
        let l4 = AboutSectionLabel()
        l4.text = "DEVELOPER"
        l4.textColor = UIColor(red:0.753, green:0.224, blue:0.169, alpha: 1)
        
        let l5 = AboutSectionLabel()
        l5.text = "AND"
        l5.textColor = UIColor(red:0.204, green:0.286, blue:0.369, alpha: 1)
        
        let l6 = AboutSectionLabel()
        l6.text = "PART TIME"
        l6.textColor = UIColor(red:0.204, green:0.286, blue:0.369, alpha: 1)
        
        let l7 = AboutSectionLabel()
        l7.text = "CS STUDENT"
        l7.textColor = UIColor(red:0.424, green:0.478, blue:0.537, alpha: 1)
        
        let l8 = AboutSectionLabel()
        l8.text = "ON A FULL TIME UNIVERSITY COURSE"
        l8.textColor = UIColor(red:0.424, green:0.478, blue:0.537, alpha: 1)
        l8.font = UIFont(name: "Montserrat-Regular", size: 16.5)
        
        view.addSubview(l1)
        view.addSubview(l2)
        view.addSubview(l3)
        view.addSubview(l4)
        view.addSubview(l5)
        view.addSubview(l6)
        view.addSubview(l7)
        view.addSubview(l8)
        view.addSubview(iconLabel)
        view.addSubview(iconLabel2)
        view.addSubview(iconLabel3)
        view.addSubview(menuToggle)
        
         menuToggle.addTarget(self, action: "togglePressed:", forControlEvents: .TouchUpInside)
        
        labels = [
            "l1":l1,
            "l2":l2,
            "l3":l3,
            "l4":l4,
            "l5":l5,
            "l6":l6,
            "l7":l7,
            "l8":l8,
            "i1": iconLabel,
            "i2": iconLabel2,
            "i3": iconLabel3
        ]
        
        layoutSubviews()
        view.layoutIfNeeded()
        menuToggle.center.y = iconLabel.center.y
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
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|-30-[l6]", options: nil, metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|-30-[l7]", options: nil, metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|-30-[l8]", options: nil, metrics: nil, views: views))
        
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[l1][l2][l3][l4][l5][l6][l7][l8]-50-|", options: nil, metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|-25-[i1]-10-[i2]-10-[i3]", options: .AlignAllCenterY, metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-48-[i1]", options: .AlignAllCenterY, metrics: nil, views: views))
    }
}

