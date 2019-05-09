//
//  DeveloperSpec.swift
//  MaxibonKataIOS
//
//  Created by Pedro Vicente Gomez on 29/06/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation
import XCTest
import SwiftCheck
@testable import MaxibonKataIOS

class DeveloperSpec: XCTestCase {

    fileprivate let anyName = "Pedro"
    fileprivate let anyNumberOfMaxibonsToGet = 11
    
    let karumiHQs: KarumiHQs = KarumiHQs()

    func testAll() {
        
        property("number of maxibons when opens should be 10") <- forAll { (i : Int) in
            let karumiHQs = KarumiHQs()
            return karumiHQs.maxibonsLeft == 10
        }
        
        property("number of maxibons cannot be lower than 2") <- forAll { (i : Int) in
            let karumiHQs = KarumiHQs()
            let developer = Developer(name: "Whatever", numberOfMaxibonsToGet: i)
            karumiHQs.openFridge(developer)
            return karumiHQs.maxibonsLeft > 2
        }
        
        property("number of maxibons cannot be lower than 2 (with Generator)") <- forAll { (developer : Developer) in
            let karumiHQs = KarumiHQs()
            karumiHQs.openFridge(developer)
            return karumiHQs.maxibonsLeft > 2
        }
        
        property("number of maxibons cannot be lower than 2 (with List Generator)") <- forAll { (developer : [Developer]) in
            let karumiHQs = KarumiHQs()
            karumiHQs.openFridge(developer)
            return karumiHQs.maxibonsLeft > 2
        }
        
        
        property("number of maxibons cannot be lower than 2 (with Generator arbitrary Hungry)") <- forAll(Developer.arbitraryHungry) { (developer : Developer) in
            let karumiHQs = KarumiHQs()
            karumiHQs.openFridge(developer)
            return karumiHQs.maxibonsLeft > 2
        }
        
        property("number of maxibons cannot be lower than 2 (with Generator arbitrary not Hungry)") <- forAll(Developer.arbitraryNotHungry) { (developer : Developer) in
            let karumiHQs = KarumiHQs()
            karumiHQs.openFridge(developer)
            return karumiHQs.maxibonsLeft > 2
        }
        
        property("should send a mail when the maxibons when angry people grab maxibons") <- forAll(Developer.arbitraryHungry) { (developer : Developer) in
            
            let mockChat = MockChat()
            let karumiHQs = KarumiHQs(chat: mockChat)
            
            karumiHQs.openFridge(developer)
            
            let message: String? = "Hello guys, This is \(developer.name), we need more Maxibons"
                
            return message == mockChat.messageSent
        }
        
        property("should send a mail when the maxibons when not angry people grab maxibons") <- forAll(Developer.arbitraryNotHungry) { (developer : Developer) in
            
            let mockChat = MockChat()
            let karumiHQs = KarumiHQs(chat: mockChat)
            
            karumiHQs.openFridge(developer)
               
            return nil == mockChat.messageSent
        }
        
        
    }

}
