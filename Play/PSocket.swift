//
//  PSocket.swift
//  Play
//
//  Created by Sahand Nayebaziz on 12/12/15.
//  Copyright © 2015 Sahand Nayebaziz. All rights reserved.
//

import Foundation
import Socket_IO_Client_Swift

class PSocket {
    
    static let go = PSocket()
    
    private let socket = SocketIOClient(socketURL: "http://10.0.1.50:1993", options: [.Log(true), .ForcePolling(true)])
    
    func tryConnecting() {
        socket.on("connect") { data, ack in
            print("socket connected")
            var code = "print(\"hello world. Love, iPad.\")"
            self.socket.emit("message", ["code": code])
        }
        socket.connect()
    }
    
}