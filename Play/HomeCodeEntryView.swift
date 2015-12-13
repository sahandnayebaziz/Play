//
//  HomeCodeEntryView.swift
//  Play
//
//  Created by Sahand Nayebaziz on 12/12/15.
//  Copyright © 2015 Sahand Nayebaziz. All rights reserved.
//

import UIKit

class HomeCodeEntryView: UIView, UITextViewDelegate {
    
    private var entryView = UITextView()
    var delegate: PlayCodeTransportDelegate? = nil
    
    init() {
        super.init(frame: CGRectZero)
        
        backgroundColor = UIColor.whiteColor()
        layer.cornerRadius = 6.0
        
        addSubview(entryView)
        entryView.snp_makeConstraints { make in
            make.height.equalTo(snp_height).offset(-32)
            make.width.equalTo(snp_width).offset(-24)
            make.center.equalTo(snp_center)
        }
        
        entryView.backgroundColor = UIColor.clearColor()
        entryView.autocapitalizationType = .None
        entryView.autocorrectionType = .No
        entryView.font = UIFont(name: "Menlo-Regular", size: 18)
        entryView.delegate = self
        // sign up for notifications to dismiss
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func run() {
        let text = entryView.text
        guard text.characters.count != 0 else {
            return
        }
        
        delegate?.receiveCodeTransportPacket(PlayCodeTransportType.PreProcess, code: text)
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        print("detected start")
        textView.inputAssistantItem.trailingBarButtonGroups = []
    }
    
    

}
