//
//  TheNewsContentTypeViewController.swift
//  HopperBus
//
//  Created by Tosin Afolabi on 15/12/2014.
//  Copyright (c) 2014 Tosin Afolabi. All rights reserved.
//

import UIKit

// MARK: - Onboarding Content Type Enum

enum ProcusesContentType {
    case Route, RealTime, RouteTimes, Map
    
    var title: String {
        switch self {
        case .Route:
            return "NEED AN EXCUSE?"
        case .RealTime:
            return "FOR DEVELOPERS"
        case .RouteTimes:
            return "FOR DESIGNERS"
        case .Map:
            return "FOR ACCOUNT ..."
        }
    }
    
    var info: String {
        switch self {
        case .Route:
            return "Pick your profession and get the perfect excuse"
        case .RealTime:
            return "Shake the app for even more excuses"
        case .RouteTimes:
            return "Over 200 curated excuses are available"
        case .Map:
            return "Beautiful, elegant, simple design."
        }
    }
    
    var image: UIImage {
        switch self {
        case .Route:
            if iPhone6Or6Plus {
                return UIImage(named: "P1")!
            } else {
                return UIImage(named: "P1_i5")!
            }
        case .RealTime:
            if iPhone6Or6Plus {
                return UIImage(named: "P2")!
            } else {
                return UIImage(named: "P2_i5")!
            }
        case .RouteTimes:
            if iPhone6Or6Plus {
                return UIImage(named: "P3")!
            } else {
                return UIImage(named: "P3_i5")!
            }
        case .Map:
            if iPhone6Or6Plus {
                return UIImage(named: "P4")!
            } else {
                return UIImage(named: "P4_i5")!
            }
        }
    }
    
    static let allTypes: [ProcusesContentType] = [.Route, .RealTime, .RouteTimes, .Map]
}

// MARK: - Onboarding Content View Controller

class ProcusesContentController: UIViewController {
    
    // MARK: - Properties
    
    let type: ProcusesContentType
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = self.type.title
        let fontSize: CGFloat = iPhone6Or6Plus ? 28 : 24
        label.font = UIFont(name: "Montserrat-Regular", size: fontSize)
        label.textColor = UIColor.whiteColor()
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        return label
        }()
    
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.text = self.type.info
        let fontSize: CGFloat = iPhone6Or6Plus ? 17 : 14
        label.font = UIFont(name: "Avenir-Book", size: fontSize)
        label.textColor = UIColor.whiteColor()
        
        label.numberOfLines = 2
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        label.textAlignment = .Center
        return label
        }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: self.type.image)
        imageView.setTranslatesAutoresizingMaskIntoConstraints(false)
        return imageView
        }()
    
    // MARK: - Initializers
    
    init(type: ProcusesContentType) {
        self.type = type
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.clearColor()
        view.addSubview(titleLabel)
        view.addSubview(infoLabel)
        view.addSubview(imageView)
        
        layoutSubviews()
    }
    
    func layoutSubviews() {
        
        let views = [
            "title": titleLabel,
            "info": infoLabel,
            "image": imageView
        ]
        
        var vDistance = iPhone6P ? 112 : 92
        vDistance = iPhone5 ? 69 : vDistance
        vDistance = iPhone4S ? 61 : vDistance
        
        let metrics = [
            "vDistance" : vDistance
        ]
        
        view.addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|-30-[info]-30-|", options: nil, metrics: nil, views: views))
        if !iPhone4S {
            view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-15-[title]-8-[info(>=46)]-(vDistance)-[image]", options: .AlignAllCenterX, metrics: metrics, views: views))
        } else {
            view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-10-[title]-2-[info]-(vDistance)-[image]", options: .AlignAllCenterX, metrics: metrics, views: views))
        }
        
    }
}
