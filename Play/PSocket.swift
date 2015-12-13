//
//  PSocket.swift
//  Play
//
//  Created by Sahand Nayebaziz on 12/12/15.
//  Copyright © 2015 Sahand Nayebaziz. All rights reserved.
//

import Foundation
import Socket_IO_Client_Swift

class PlaySocket {
    
    static let go = PlaySocket()
    
    private let socket = SocketIOClient(socketURL: "http://10.0.1.50:1993", options: [])
    
    func tryConnecting() {
        socket.on("connect") { data, ack in
            print("socket connected")
        }
        socket.connect()
    }
    
    func sendCode(source: PlayCodeTransportDelegate, code: String) {
        socket.on("response") { data, ack in
            guard !data.isEmpty else {
                return
            }
            
            let responseDict = data[0] as! [String:String]
            let response = responseDict["response"]!
            source.receiveCodeTransportPacket(PlayCodeTransportType.PostProcess, code: response)
        }
        socket.emit("message", ["code": code])
    }
    
}