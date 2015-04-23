//
//  AboutSectionLabel.swift
//  TosinAfolabi
//
//  Created by Tosin Afolabi on 4/21/15.
//  Copyright (c) 2015 Tosin Afolabi. All rights reserved.
//

import UIKit

class AboutSectionLabel: UILabel {
    
    init() {
        super.init(frame: CGRectZero)
        self.font = UIFont(name: "Montserrat-Regular", size: 50.0)
        self.setTranslatesAutoresizingMaskIntoConstraints(false)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
}
