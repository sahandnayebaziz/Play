//
//  ViewController.swift
//  Play
//
//  Created by Sahand Nayebaziz on 12/12/15.
//  Copyright © 2015 Sahand Nayebaziz. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController, PCodeDisplayDelegate {
    
    var textTerminal: UITextView? = nil
    var responseTerminal: UITextView? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        PSocket.go.tryConnecting()
        PSocket.go.codeDisplayDelegate = self
        view.backgroundColor = UIColor.blackColor()
        
        let text = UITextView()
        view.addSubview(text)
        textTerminal = text
        text.snp_makeConstraints { make in
            make.top.equalTo(view.snp_top).offset(16)
            make.height.equalTo(view.snp_height).dividedBy(2)
            make.width.equalTo(view.snp_width).dividedBy(2)
            make.centerX.equalTo(view.snp_centerX)
        }
        
        let response = UITextView()
        view.addSubview(response)
        responseTerminal = response
        response.snp_makeConstraints { make in
            make.top.equalTo(text.snp_bottom).offset(16)
            make.bottom.equalTo(view.snp_bottom).offset(-16)
            make.width.equalTo(text.snp_width)
            make.centerX.equalTo(text.snp_centerX)
        }
        
        for view in [text, response] {
            view.backgroundColor = UIColor.clearColor()
            view.autocapitalizationType = .None
            view.autocorrectionType = .No
            view.font = UIFont(name: "Menlo-Regular", size: 18)
        }
        
        text.textColor = UIColor.whiteColor()
        response.textColor = UIColor.grayColor()
        response.editable = false
        response.selectable = false
    }
    
    override func viewWillAppear(animated: Bool) {
        textTerminal?.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override var keyCommands: [UIKeyCommand]? {
        return [
            UIKeyCommand(input: "r", modifierFlags: .Command, action: "run", discoverabilityTitle: "Run")
        ]
    }
    
    func run() {
        PSocket.go.sendCode(textTerminal!.text)
    }
    
    func receivePrintResult(result: String) {
        print(result)
        responseTerminal?.text = result
    }



}

