//
//  HomeCodeResultsView.swift
//  Play
//
//  Created by Sahand Nayebaziz on 12/12/15.
//  Copyright © 2015 Sahand Nayebaziz. All rights reserved.
//

import UIKit

class HomeCodeResultsView: UIView, PlayCodeTransportDelegate {
    
    var resultsView = UITextView()
    var delegate: PlayCodeTransportDelegate? = nil

    init() {
        super.init(frame: CGRectZero)
        
        addSubview(resultsView)
        resultsView.snp_makeConstraints { make in
            make.height.equalTo(snp_height).offset(-32)
            make.width.equalTo(snp_width).offset(-24)
            make.center.equalTo(snp_center)
        }
        
        resultsView.backgroundColor = UIColor.clearColor()
        resultsView.editable = false
        resultsView.selectable = false
        resultsView.font = UIFont(name: "Menlo-Regular", size: 18)
        // sign up for notifications to dismiss
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func receiveCodeTransportPacket(header: PlayCodeTransportType, code: String) {
        if header == PlayCodeTransportType.PostProcess {
            resultsView.text = code
        }
    }
}
