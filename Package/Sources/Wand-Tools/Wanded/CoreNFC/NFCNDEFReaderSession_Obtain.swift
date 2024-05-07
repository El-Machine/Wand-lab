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
//extension NFCNDEFReaderSession: AskingNil {
//
//    @inline(__always)
//    public 
//    static func wand<T>(_ wand: Wand, asks ask: Ask<T>) {
//
//        //Save ask
//        guard wand.answer(the: ask) else {
//            return
//        }
//
//        //Request for a first time
//
//        //Prepare context
//        let delegate = wand.add(Delegate())
//
//        let session = Self(delegate: delegate,
//                          queue: DispatchQueue.global(),
//                          invalidateAfterFirstRead: false)
//
//        let message: String = wand.get() ?? "Hold to know what it is 🧙🏾‍♂️"
//        session.alertMessage = message
//
//        //Set the cleaner
//        wand.setCleaner(for: ask) {
//            session.invalidate()
//
//            Wand.log("|🌜 Cleaned '\(ask.key)'")
//        }
//
//        wand.add(session)
//
//        //Make request
//        session.begin()
//    }
//
//}
//extension NFCNDEFReaderSession {
//
//    class Delegate: NSObject, NFCNDEFReaderSessionDelegate, Wanded {
//
//        func readerSessionDidBecomeActive(_ session: NFCNDEFReaderSession) {
//            isWanded?.add(true as Bool, for: "NFCNDEFReaderSessionIsReady")
//        }
//
//        func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
//            isWanded?.add(false as Bool, for: "NFCNDEFReaderSessionIsReady")
//            isWanded?.add(error)
//        }
//
//        func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
//        }
//
//        @available(iOS 13.0, *)
//        func readerSession(_ session: NFCNDEFReaderSession, didDetect tags: [NFCNDEFTag]) {
//
//            if let first = tags.first {
////                isPiped?.put(first)
//                
//                if let wand = isWanded {
//
//
//
////                    let address = MemoryAddress.address(of: first)
////                    print("💪🏽 set \(address)")
////                    Pipe.all[address] = pipe
//
//
//                    Wand.all[Wand.address(for: first)] = Wand.Weak(item: wand)
////                    context[NFCNDEFTag.self|] = object
//
//                    wand.add(first)
//                }
//            }
//
////            if tags.count > 1 {
////                isPiped?.put(tags)
////            }
//        }
//
//    }
//
//}
//
//#endif
