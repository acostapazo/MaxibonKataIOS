//
//  KarumiHQs.swift
//  MaxibonKata
//
//  Created by Pedro Vicente Gomez on 29/06/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation

public final class KarumiHQs {

    fileprivate let chat: Chat

    var maxibonsLeft: Int
    var numberMaxibonsBox: Int

    public init(chat: Chat) {
        self.maxibonsLeft = 10
        self.chat = chat
        self.numberMaxibonsBox = 10
    }

    public convenience init() {
        self.init(chat: Slack())
    }

    public func openFridge(_ developer: Developer) {
        grabMaxibons(developer)
    }

    public func openFridge(_ developers: [Developer]) {
        for developer in developers{
            openFridge(developer)
        }
    }
    
    public func grabMaxibons(_ developer:Developer){
        maxibonsLeft -= developer.numberOfMaxibonsToGet;
        if maxibonsLeft < 0{
            maxibonsLeft = 0
        }
        checkMaxibons(developer.name)
    }
    
    public func checkMaxibons(_ developerName: String){
        if maxibonsLeft <= 2{
            reFill(developerName)
        }
    }
    
    public func reFill(_ developerName: String){
        chat.send(message: "Hello guys, This is \(developerName), we need more Maxibons")
        maxibonsLeft += numberMaxibonsBox
    }

}
