/// Copyright © 2020-2024 El Machine 🤖 (http://el-machine.com/)
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.
///
/// Created by Alex Kozin
///

import CoreLocation
import CoreMotion

import Wand
import XCTest

class Expect_T_Tests: XCTestCase {

    func test_Every() throws {
        //Insert 'count' times
        let count: Int = .any(in: 1...22)

        let e = expectation()
        e.expectedFulfillmentCount = count

        var last: Vector?

        //Wait for 'count' Vectors
        weak var wand: Wand!
        wand = |.every { (vector: Vector) in
            //Is equal?
            if vector == last {
                e.fulfill()
            }
        }

        //Put for 'count' Vectors
        var i = 0
        (0..<count).forEach { _ in
            let vector = Vector.any
            last = vector

            wand.add(vector)

            print(count)
            i = i+1
        }

        waitForExpectations(timeout: .default)

        wand.close()
        //TODO: Fix
        //XCTAssertNil(wand)
    }

    func test_One() throws {
        let e = expectation()

        let vector = Vector.any

        weak var wand: Wand!
        wand = |.one { (vector: Vector) in
            e.fulfill()
        }

        wand.add(vector)

        waitForExpectations()
        XCTAssertNil(wand)
    }

    func test_While() throws {

        func put() {
            DispatchQueue.main.async {
                wand.add(Vector.any)
            }
        }

        let e = expectation()

        weak var wand: Wand!
        wand = |.while { (vector: Vector) in

            if vector.id == 2 {
                e.fulfill()
                return false
            } else {
                put()
                return true
            }

        }

        put()

        waitForExpectations()
        XCTAssertNil(wand)
    }


}


fileprivate struct Vector: Equatable, Any_ {

    let id: Int

    let x, y, z: Float
    var t: TimeInterval


    static var any: Vector {
        .init(id: .any(in: 0...4), x: .any, y: .any, z: .any, t: .any)
    }
}

extension Vector: AskingNil, Wanded {

    static func wand<T>(_ wand: Wand, asks: Ask<T>) {

        _ = wand.answer(the: asks)

    }

}
