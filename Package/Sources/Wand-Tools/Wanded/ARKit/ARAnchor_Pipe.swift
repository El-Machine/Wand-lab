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
//import Foundation
//
//import Wand
//
//extension Ask where T == [ARAnchor] {
//
//    class DidAdd: Ask {
//    }
//
//    class DidUpdate: Ask {
//    }
//
//    static func didAdd(handler: @escaping ([ARAnchor])->() ) -> DidAdd {
//        DidAdd.every(handler)
//    }
//
//    static func didUpdate(handler: @escaping ([ARAnchor])->() ) -> DidUpdate {
//        DidUpdate.every(handler)
//    }
//
//}
//
//@discardableResult
//prefix func | (ask: Ask<[ARAnchor]>.DidAdd) -> Pipe {
//    Pipe() | ask
//}
//
//@discardableResult
//prefix func | (ask: Ask<[ARAnchor]>.DidUpdate) -> Pipe {
//    Pipe() | ask
//}
//
//@discardableResult
//func |<T> (scope: T, ask: Ask<[ARAnchor]>.DidAdd) -> Pipe {
//
//    let pipe = Pipe.attach(to: scope)
//
//    guard pipe.start(expecting: ask, key: type(of: ask)|) else {
//        return pipe
//    }
//
//    let session = (scope as? ARSession) ?? pipe.get()
//
//    ask.cleaner = {
//        session.pause()
//    }
//
//    return pipe
//}
//
//@discardableResult
//func |<T> (scope: T, ask: Ask<[ARAnchor]>.DidUpdate) -> Pipe {
//    let pipe = Pipe.attach(to: scope)
//
//    ask.key = type(of: ask)|
//
//    guard pipe.ask(for: ask) else {
//        return pipe
//    }
//
//    let session = (scope as? ARSession) ?? pipe.get()
//
//    ask.cleaner = {
//        session.pause()
//    }
//
//    return pipe
//}
//
//@available(*, unavailable, message: "Use label \n .didAdd \n .didUpdate")
//@discardableResult
//prefix func | (handler: @escaping ([ARAnchor])->() ) -> Pipe {
//    fatalError()
//}

#endif
