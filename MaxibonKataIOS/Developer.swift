//
//  Developer.swift
//  MaxibonKata
//
//  Created by Pedro Vicente Gomez on 29/06/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation

public struct Developer {

    public let name: String
    public let numberOfMaxibonsToGet: Int

    init(name: String, numberOfMaxibonsToGet: Int) {
        self.name = name
        if numberOfMaxibonsToGet >= 0{
            self.numberOfMaxibonsToGet = numberOfMaxibonsToGet
        }
        else{
            self.numberOfMaxibonsToGet = 0
        }
    }
    
    func isValidDeveloper() -> Bool{
        let regEx = "\\w{7,18}"
        let test = NSPredicate(format:"SELF MATCHES %@", regEx)
        return test.evaluate(with:name)
    }

}

