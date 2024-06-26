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

#if canImport(ARKit)
//import ARKit
//
//import Wand
//
//extension ARAnchor: Pipable {
//
//    public enum With: String {
//
//        case add, update, remove
//
//    }
//
//}
//
//@available(iOS 13.0, *)
//extension Array: Asking where Element == ARAnchor {
//
//}
//
//@available(iOS 13.0, *)
//extension Array: As, ExpectableWithout where Element == ARAnchor {
//
//    public static func start<P, E>(expectating expectation: Expect<E>, with piped: P, on pipe: Pipe) {
//
//        let key = expectation.key
//        guard pipe.start(expecting: expectation, key: key) else {
//            return
//        }
//
//        let session = (piped as? ARSession) ?? pipe.get()
//
//        expectation.cleaner = {
//            session.pause()
//        }
//
//    }
//
//
//}
//
//@available(iOS 13.0, *)
//public extension Expect where T == Array<ARAnchor> {
//
//    static func add(_ handler: ( (T)->() )? = nil) -> Self {
//        Expect.every(#function, handler) as! Self
//    }
//
//    static func didUpdate(_ handler: ( (T)->() )? = nil) -> Self {
//        Expect.every(#function, handler) as! Self
//    }
//
//    static func remove(_ handler: ( (T)->() )? = nil) -> Self {
//        Expect.every(#function, handler) as! Self
//    }
//
//}
//
//import ARKit.ARAppClipCodeAnchor

//@available(iOS 14.3, *)
//extension ARAppClipCodeAnchor: Operatable, ExpectableWithout {
//
//    public typealias With = Array<ARAnchor>.With
//
//    public static func start<P, E>(expectating expectation: Expect<E>, with piped: P, on pipe: Pipe) {
//
//        let with = expectation.with as! With
//        let key = E.self| + with.rawValue
//
//        guard pipe.start(expecting: expectation, key: key) else {
//            return
//        }
//
//        //Add flag: Waiting for some ARAnchor
//        let anchorKey = ARAnchor.self|
//        if pipe.expectations[anchorKey] == nil {
//            pipe.expectations[anchorKey] = []
//        }
//
//        with | [ARAnchor].every
//    }
//
//
//}

#endif
