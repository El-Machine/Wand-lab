///
/// Copyright © 2020-2024 El Machine 🤖
/// https://el-machine.com/
///
/// Licensed under the Apache License, Version 2.0 (the "License");
/// you may not use this file except in compliance with the License.
/// You may obtain a copy of the License at
///
/// 1) LICENSE file
/// 2) https://apache.org/licenses/LICENSE-2.0
///
/// Unless required by applicable law or agreed to in writing, software
/// distributed under the License is distributed on an "AS IS" BASIS,
/// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
/// See the License for the specific language governing permissions and
/// limitations under the License.
///
/// Created by Alex Kozin
/// 2020 El Machine


#if !os(macOS) && !os(tvOS)
import Wand
import XCTest

class Collections_Tests: XCTestCase {

    func test_ArrayRange() throws {
        let array = [Bool](repeating: false, count: 42)

        let range: Range<Int> = array|
        XCTAssertTrue(range.first == 0)
        XCTAssertTrue(range.last == array.count - 1)
    }

    @available(macOS, unavailable)
    func test_ArrayIndexPath() throws {
        let array = [Bool](repeating: false, count: 42)

        let paths: [IndexPath] = array|
        XCTAssertTrue(paths.first?.row == 0)
        XCTAssertTrue(paths.last?.row == array.count - 1)
    }

    @available(macOS, unavailable)
    func test_RangeIndexPath() throws {
        let range = 0..<42

        let paths: [IndexPath] = range|
        XCTAssertTrue(paths.first?.row == 0)
        XCTAssertTrue(paths.last?.row == range.last)
    }

    func test_RangeInt() throws {
        let range = 0..<42

        let randomInt: Int = range|
        XCTAssertTrue(randomInt >= range.first!)
        XCTAssertTrue(randomInt <= range.last!)
    }

}

#endif
