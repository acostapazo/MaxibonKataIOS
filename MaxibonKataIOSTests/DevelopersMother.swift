//
//  DevelopersMother.swift
//  MaxibonKataIOSTests
//
//  Created by Artur Costa-Pazo on 09/05/2019.
//  Copyright © 2019 GoKarumi. All rights reserved.
//

import Foundation
@testable import MaxibonKataIOS

class DevelopersMother{
    
    static public func getPedroDeveloper() -> Developer{
        return Developer(name: "Pedro", numberOfMaxibonsToGet: 3)
    }
    
    static public func getDavidDeveloper() -> Developer{
        return Developer(name: "David", numberOfMaxibonsToGet: 0)
    }
    
    static public func getAlbertoDeveloper() -> Developer{
        return Developer(name: "Alberto", numberOfMaxibonsToGet: 1)
    }
    
    static public func getJorgeDeveloper() -> Developer{
        return Developer(name: "Jorge", numberOfMaxibonsToGet: 2)
    }
    
    static public func getSergioDeveloper() -> Developer{
        return Developer(name: "Sergio", numberOfMaxibonsToGet: 1)
    }
}
