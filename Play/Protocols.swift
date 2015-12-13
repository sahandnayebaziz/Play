//
//  Protocols.swift
//  Play
//
//  Created by Sahand Nayebaziz on 12/12/15.
//  Copyright © 2015 Sahand Nayebaziz. All rights reserved.
//

import Foundation

enum PlayCodeTransportType: String {
    case PreProcess, PostProcess
}

protocol PlayCodeTransportDelegate {
    func receiveCodeTransportPacket(header: PlayCodeTransportType, code: String)
}

enum PlayCodeDisplayModificationType: String {
    case FontBigger, FontSmaller, FontReset
}

protocol PlayCodeDisplayModificationDelegate {
    func receiveCodeDisplayModificationRequest(modifications: PlayCodeDisplayModificationType)
}

