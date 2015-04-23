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

class A8ViewController: A0ViewController {
    
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
    
    lazy var imageView: UIImageView = {
        let image = UIImage(named: "ProfilePic2.jpg")
        let imageView = UIImageView(image: image)
        imageView.layer.cornerRadius = 40.0
        imageView.layer.masksToBounds = true
        imageView.setTranslatesAutoresizingMaskIntoConstraints(false)
        return imageView
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        type = .A8
        
        let l1 = AboutSectionLabel()
        l1.text = "SO THAT'S ME"
        l1.font = UIFont(name: "Montserrat-Regular", size: 30.0)
        l1.textColor = UIColor(red:0.204, green:0.286, blue:0.369, alpha: 1)
        
        let l2 = AboutSectionLabel()
        l2.text = "TWITTER"
        l2.textColor = UIColor(red:0.333, green:0.675, blue:0.933, alpha: 1)
        
        let l3 = AboutSectionLabel()
        l3.text = "LINKEDIN"
        l3.textColor = UIColor(red:0.035, green:0.463, blue:0.706, alpha: 1)
        
        let l4 = AboutSectionLabel()
        l4.text = "FACEBOOK"
        l4.textColor = UIColor(red:0.231, green:0.349, blue:0.596, alpha: 1)
        
        let l5 = AboutSectionLabel()
        l5.text = "MEDIUM"
        l5.textColor = UIColor.blackColor()
        
        view.addSubview(l1)
        view.addSubview(l2)
        view.addSubview(l3)
        view.addSubview(l4)
        view.addSubview(l5)
        view.addSubview(menuToggle)
        view.addSubview(imageView)
        
        menuToggle.addTarget(self, action: "togglePressed:", forControlEvents: .TouchUpInside)
        
        labels = [
            "l1":l1,
            "l2":l2,
            "l3":l3,
            "l4":l4,
            "l5":l5
        ]
        
        layoutSubviews()
        menuToggle.center.y = imageView.center.y
    }
    
    func togglePressed(sender: JTHamburgerButton) {
        
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
        
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[l1][l5][l2][l3][l4]-50-|", options: nil, metrics: nil, views: views))
        
        layout(imageView) { imageView in
            imageView.width == 80
            imageView.height == 80
            imageView.left == imageView.superview!.left + 30
            imageView.top == imageView.superview!.top + 48
        }
    }
}

