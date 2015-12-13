//
//  PSocket.swift
//  Play
//
//  Created by Sahand Nayebaziz on 12/12/15.
//  Copyright © 2015 Sahand Nayebaziz. All rights reserved.
//

import Foundation
import Socket_IO_Client_Swift

protocol PCodeDisplayDelegate {
    func receivePrintResult(result: String)
}

class PSocket {
    
    static let go = PSocket()
    
    private let socket = SocketIOClient(socketURL: "http://10.0.1.50:1993", options: [])
    var codeDisplayDelegate: PCodeDisplayDelegate? = nil
    
    func tryConnecting() {
        socket.on("connect") { data, ack in
            print("socket connected")
        }
        
        socket.on("response") { data, ack in
            guard !data.isEmpty else {
                return
            }
            
            let responseDict = data[0] as! [String:String]
            self.codeDisplayDelegate?.receivePrintResult(responseDict["response"]!)
        }
        
        socket.connect()
    }
    
    func sendCode(code: String) {
        socket.emit("message", ["code": code])
    }
    
}