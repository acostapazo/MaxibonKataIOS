//
//  ArbitraryDeveloper.swift
//  MaxibonKataIOSTests
//
//  Created by Artur Costa-Pazo on 09/05/2019.
//  Copyright © 2019 GoKarumi. All rights reserved.
//

import SwiftCheck
@testable import MaxibonKataIOS


extension Developer: Arbitrary {
    
    public static var arbitrary: Gen<Developer> {
        return Gen<Developer>.one(of: [
            Gen<Developer>.pure(DevelopersMother.getAlbertoDeveloper()),
            Gen<Developer>.pure(DevelopersMother.getDavidDeveloper()),
            Gen<Developer>.pure(DevelopersMother.getJorgeDeveloper()),
            Gen<Developer>.pure(DevelopersMother.getPedroDeveloper()),
            Gen<Developer>.pure(DevelopersMother.getSergioDeveloper())
            ])
    }

    public static var arbitraryHungry: Gen<Developer> {
        return Gen<Int>.fromElements(in:8...Int.max).map{
            let name = String.arbitrary.generate
            return Developer(name: name, numberOfMaxibonsToGet: $0)
        }
    }
    
    public static var arbitraryNotHungry: Gen<Developer> {
        return Gen<Int>.fromElements(in:0...7).map{
            let name = String.arbitrary.generate
            return Developer(name: name, numberOfMaxibonsToGet: $0)
        }
    }
}



