//
//  HomeTitleView.swift
//  Play
//
//  Created by Sahand Nayebaziz on 12/12/15.
//  Copyright © 2015 Sahand Nayebaziz. All rights reserved.
//

import UIKit

class HomeTitleView: UIView {
    
    var label = UILabel()
    
    convenience init() {
        self.init(frame: CGRectZero)
        
        label.font = UIFont.systemFontOfSize(28, weight: UIFontWeightRegular)
        label.textColor = UIColor.blackColor()
        label.text = "Play"
        label.textAlignment = .Center
        addSubview(label)
        label.snp_makeConstraints { make in
            make.center.equalTo(snp_center)
            make.top.equalTo(snp_top)
        }
    }
    
}
