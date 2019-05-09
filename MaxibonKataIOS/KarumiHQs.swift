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

    public init(chat: Chat) {
        self.maxibonsLeft = 10
        self.chat = chat
    }

    public convenience init() {
        self.init(chat: Slack())
    }

    public func openFridge(_ developer: Developer) {
    }

    public func openFridge(_ developers: [Developer]) {
      
    }

}
