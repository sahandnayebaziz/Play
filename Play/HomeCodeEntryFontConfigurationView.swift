//
//  HomeCodeEntryFontConfigurationView.swift
//  Play
//
//  Created by Sahand Nayebaziz on 12/12/15.
//  Copyright © 2015 Sahand Nayebaziz. All rights reserved.
//

import UIKit

class HomeCodeEntryFontConfigurationView: UIView {
    
    var delegate: PlayCodeDisplayModificationDelegate
    
    init(delegate: PlayCodeDisplayModificationDelegate) {
        self.delegate = delegate
        super.init(frame: CGRectZero)
        
        let buttonBigger = UIButton(type: .System)
        buttonBigger.setTitle("A", forState: .Normal)
        addSubview(buttonBigger)
        buttonBigger.snp_makeConstraints { make in
            make.top.equalTo(snp_top)
        }
        
        let buttonSmaller = UIButton(type: .System)
        buttonSmaller.setTitle("a", forState: .Normal)
        addSubview(buttonSmaller)
        buttonSmaller.snp_makeConstraints { make in
            make.top.equalTo(buttonBigger.snp_bottom)
        }
        
        for button in [buttonBigger, buttonSmaller] {
            button.snp_makeConstraints { make in
                make.height.equalTo(snp_height).dividedBy(2)
                make.width.equalTo(snp_width)
                make.centerX.equalTo(snp_centerX)
            }
        }
        
        buttonBigger.addTarget(self, action: "tappedBigger", forControlEvents: .TouchUpInside)
        buttonSmaller.addTarget(self, action: "tappedSmaller", forControlEvents: .TouchUpInside)
        addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: "heldForReset"))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tappedBigger() {
        delegate.receiveCodeDisplayModificationRequest(.FontBigger)
    }
    
    func tappedSmaller() {
        delegate.receiveCodeDisplayModificationRequest(.FontSmaller)
    }
    
    func heldForReset() {
        delegate.receiveCodeDisplayModificationRequest(.FontReset)
    }
    
}
