//
//  HomeCodeView.swift
//  Play
//
//  Created by Sahand Nayebaziz on 12/12/15.
//  Copyright © 2015 Sahand Nayebaziz. All rights reserved.
//

import UIKit

class HomeCodeView: UIView, PlayCodeTransportDelegate {
    
    private var results = HomeCodeResultsView()
    private var entry = HomeCodeEntryView()
    var delegates: [PlayCodeTransportDelegate] = []

    init() {
        super.init(frame: CGRectZero)
        
        addSubview(results)
        results.snp_makeConstraints { make in
            make.top.equalTo(snp_top)
            make.height.equalTo(200)
            make.width.equalTo(snp_width)
            make.centerX.equalTo(snp_centerX)
        }
        results.delegate = self
        delegates.append(results)
        
        addSubview(entry)
        entry.snp_makeConstraints { make in
            make.bottom.equalTo(snp_bottom)
            make.width.equalTo(snp_width)
            make.centerX.equalTo(snp_centerX)
            make.top.equalTo(results.snp_bottom).offset(40)
        }
        entry.delegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func receiveCodeTransportPacket(header: PlayCodeTransportType, code: String) {
        switch header {
        case .PreProcess:
            PlaySocket.go.sendCode(self, code: code)
        case .PostProcess:
            for delegate in delegates {
                delegate.receiveCodeTransportPacket(PlayCodeTransportType.PostProcess, code: code)
            }
        }
    }
    
    override var keyCommands: [UIKeyCommand]? {
        return [
            UIKeyCommand(input: "r", modifierFlags: .Command, action: "run", discoverabilityTitle: "Run")
        ]
    }

}
