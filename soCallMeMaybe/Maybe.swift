//
//  Maybe.swift
//  soCallMeMaybe
//
//  Created by Jonathon Day on 12/13/16.
//  Copyright © 2016 dayj. All rights reserved.
//

import Foundation

enum Maybe<Element> : ExpressibleByNilLiteral {
    case some(Element)
    case none
    
    
    func transformUnwrapped<U>(_ transform: (Element) -> U) -> Maybe<U> {
        switch self {
        case .some(let x):
            return .some(transform(x))
        case .none:
            return .none
        }
        
    }
    
    func unwrap() -> Element {
        switch self {
        case .none:
            fatalError()
        case .some(let value):
            return value
        }
    }
    
    init(nilLiteral: ()) {
        self = .none
    }
    
    init(_ value: Element) {
        self = .some(value)
    }
}

//extension Maybe where Element: Equatable {
//    
//    static func ==(lhs: Maybe<Element>, rhs: Maybe<Element>) -> Bool {
//        switch (lhs, rhs) {
//        case (.some(let x), .some(let y)):
//            return x == y
//        case (.none, .none):
//            return true
//        case (.none, .some(_)), (.some(_), .none):
//            return false
//        }
//    }
//}


extension Maybe where Element: Equatable {
    
    static func ==(lhs: Maybe<Element>, rhs: Maybe<Element>) -> Bool {
        switch (lhs, rhs) {
        case (.some(let x), .some(let y)):
            return x == y
        case (.none, .none):
            return true
        case (.none, .some(_)), (.some(_), .none):
            return false
        }
    }
}



