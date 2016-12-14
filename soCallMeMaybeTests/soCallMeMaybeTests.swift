//
//  soCallMeMaybeTests.swift
//  soCallMeMaybeTests
//
//  Created by Jonathon Day on 12/13/16.
//  Copyright © 2016 dayj. All rights reserved.
//

import XCTest
@testable import soCallMeMaybe

class soCallMeMaybeTests: XCTestCase {
    
    func testEquality() {
        let result1 = Maybe.some(1)
        let expected1 = Maybe.some(1)
        XCTAssertTrue(result1 == expected1)
    }
    
    func testTransformUnwrapped() {
        let preTransform = Maybe.some("534")
        let result = preTransform.transformUnwrapped { Int($0)! }
        let expected = Maybe.some(534)
        XCTAssertTrue(expected == result)
        
    }
    
    
    func testTransformUnwrappedNone() {
        let asdf: Maybe<String> = Maybe.none
        let qwerty = asdf.transformUnwrapped { Int($0)! }
        XCTAssertTrue(Maybe<Int>.none == qwerty)
    }
    
    
    
    func testUnWrap() {
        let wrapped = Maybe.some(534)
        let unwrapped = wrapped.unwrap()
        XCTAssertEqual(unwrapped, 534)
    }
    
    func testNil() {
        let qwerty: Maybe<String> = nil
        XCTAssertTrue(Maybe<String>.none == qwerty)
    }
    
    
}
