//
//  Resource.swift
//  TestFramework
//
//  Created by Cong Bui Thanh on 04/07/2023.
//

import Foundation

final class Resource {
    public static func shared() -> Resource {
        return Resource()
    }

    let name = "TestFramework"
    
    public func add(a: Int, b: Int) -> Int {
        return a + b
    }
    
    public func sub(a: Int, b: Int) -> Int {
        return a - b
    }
    
    public func logConsole(_ string: String){
        print("my string = \(string)")
    }
    
}
