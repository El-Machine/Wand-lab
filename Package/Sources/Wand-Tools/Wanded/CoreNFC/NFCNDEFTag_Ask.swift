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
//
//#if canImport(CoreNFC)
//import CoreNFC
//import Wand
//
///// Ask
/////
///// |{ tag in
/////
///// }
/////
//@inline(__always)
//@available(iOS 13.0, *)
//@discardableResult
//public 
//prefix func | (handler: @escaping (NFCNDEFTag)->() ) -> Wand {
//    nil | Ask.every(handler: handler)
//}
//
///// Ask
/////
///// |.every { tag in
/////
///// }
/////
//@inline(__always)
//@available(iOS 13.0, *)
//@discardableResult
//public 
//prefix func | (ask: Ask<NFCNDEFTag>) -> Wand {
//    nil | ask
//}
//
///// Ask
/////
///// any | { tag in
/////
///// }
/////
//@inline(__always)
//@available(iOS 13.0, *)
//@discardableResult
//public func |<C> (context: C?, handler: @escaping (NFCNDEFTag)->() ) -> Wand {
//    Wand.attach(to: context) | .every(handler: handler)
//}
//
///// Ask
/////
///// any | .every { tag in
/////
///// }
/////
//@inline(__always)
//@available(iOS 13.0, *)
//@discardableResult
//public func |<C> (context: C?, ask: Ask<NFCNDEFTag>) -> Wand {
//    Wand.attach(to: context) | ask
//}
//
///// Ask
/////
///// wand | .every { tag in
/////
///// }
/////
//@inline(__always)
//@available(iOS 13.0, *)
//@discardableResult
//public func | (wand: Wand?, ask: Ask<NFCNDEFTag>) -> Wand {
//
//    let wand = wand ?? Wand()
//
//    guard wand.answer(the: ask, check: true) else {
//        return wand
//    }
//
//    wand | Ask<NFCNDEFReaderSession>.Optional.every()
//
//    return wand
//}
//
///// Wanded
//@available(iOS 13.0, *)
//extension NFCNDEFTag {
//
//    var wand: Wand {
//        isWanded ?? Wand(for: self)
//    }
//
//    var isWanded: Wand? {
//        Wand[self]
//    }
//
//}
//
//@available(iOS 13.0, *)
//extension Ask where T == NFCNDEFTag {
//
//    @inline(__always)
//    @available(iOS 13.0, *)
//    public func write (_ message: NFCNDEFMessage, done: @escaping (NFCNDEFTag)->() ) -> Self {
//
//        let oldHandler = self.handler
//
//        let once = self.once
//
//        self.handler = {tag in
//
//            let wand = tag.wand
//
//            let session: NFCNDEFReaderSession = wand.get()!
//
//            session.connect(to: tag) { (error: Error?) in
//
//                guard wand.addIf(exist: error) == nil else {
//                    return
//                }
//
//                wand | .Optional.once(once) { (status: NFCNDEFStatus) in
//
//                    switch status {
//
//                        case .readWrite:
//
//                            let message = message
//
//                            let capacity: Int = wand.get()!
//                            if message.length > capacity {
//
//                                let e = Wand.Error.nfc("Tag capacity is too small. Minimum size requirement is \(message.length) bytes.")
//                                wand.add(e)
//
//                                return
//                            }
//
//                            tag.writeNDEF(message) { (error: Error?) in
//
//                                guard wand.addIf(exist: error) == nil else {
//                                    return
//                                }
//
//                                done(tag)
//
//                            }
//
//                        case .readOnly:
//                            let e = Wand.Error.nfc("Tag is not writable")
//                            wand.add(e)
//
//                        case .notSupported:
//                            let e = Wand.Error.nfc("Tag is not NDEF")
//                            wand.add(e)
//
//                        @unknown default:
//                            fatalError()
//
//                    }
//
//                }
//                
//            }
//
//            //Call previous handler
//            return oldHandler(tag)
//        }
//
//        return self
//    }
//
//    @inline(__always)
//    @available(iOS 13.0, *)
//    public 
//    func lock (done: @escaping (NFCNDEFTag)->() ) -> Self {
//
////        let oldHandler = self.handler
//
////        self.handler = { tag in
////
////            let pipe = tag.pipe
////
////            let session: NFCNDEFReaderSession = pipe.get()
////
////            session.connect(to: tag) { (error: Error?) in
////
////                guard pipe.putIf(exist: error) == nil else {
////                    return
////                }
////
////                tag.writeLock { error in
////
////                    if let error = error as? NFCReaderError {
////
////                        switch error.code {
////                            case .ndefReaderSessionErrorTagUpdateFailure:
////
////                                let e = Pipe.Error.nfc("Already locked tag 🦾\n")
////                                pipe.put(e)
////
////                            default:
////                                pipe.put(error as Error)
////                        }
////
////
////                        return
////                    }
////
////                    done(tag)
////                }
////
////            }
////
////            //Call previous handler
////            return oldHandler(tag)
////        }
//
//        return self
//    }
//
//}
//
//#endif
