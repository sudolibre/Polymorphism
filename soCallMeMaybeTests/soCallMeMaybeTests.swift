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
    
    func testTransformUnwrapped() {
        let asdf = Maybe("534")
        let qwerty = asdf.transformUnwrapped { Int($0)! }
        XCTAssertEqual(Maybe.some(534), qwerty)
        
    }
    
    func testTransformUnwrappedNotEqual() {
        let asdf = Maybe("534")
        let qwerty = asdf.transformUnwrapped { Int($0)! }
        XCTAssertNotEqual(qwerty, Maybe.none)
    }
    
    func testTransformUnwrappedNone() {
        let asdf: Maybe<String> = Maybe.none
        let qwerty = asdf.transformUnwrapped { Int($0)! }
        XCTAssertEqual(Maybe.none, qwerty)
    }
    
    
    
    func testUnWrap() {
        let wrapped = Maybe.some(534)
        let unwrapped = wrapped.unwrap()
        XCTAssertEqual(unwrapped, 534)
    }
    
    func testNil() {
        let qwerty: Maybe<String> = nil
        XCTAssertEqual(Maybe.none, qwerty)
    }
    
    
}
