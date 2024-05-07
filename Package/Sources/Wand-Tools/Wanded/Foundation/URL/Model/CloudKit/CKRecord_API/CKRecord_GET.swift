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

//#if canImport(CloudKit)
//import CloudKit
//import Wand
//
////GET
////Fetch for Record.ID
//@discardableResult
//func |<S>(scope: S,
//          get: Ask<CKRecord>.Get) -> Pipe {
//
//    let pipe = Pipe.attach(to: scope)
//    guard pipe.ask(for: get) else {
//        return pipe
//    }
//    
//    let o: CKFetchRecordsOperation = pipe.get()
//    
//    let database: CKDatabase = pipe.get()
//    database.add(o)
//    
//    return pipe
//}
//
////GET
////Query with predicate
//@discardableResult
//func |<S>(scope: S,
//       get: Ask<[CKRecord]>.Get) -> Pipe {
//
//    let pipe = Pipe.attach(to: scope)
//    guard pipe.ask(for: get) else {
//        return pipe
//    }
//
//    let o: CKQueryOperation = pipe.get()
//
//    let database: CKDatabase = pipe.get()
//    database.add(o)
//
//    return pipe
//}
//
//#endif
