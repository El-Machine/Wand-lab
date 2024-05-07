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
//#if canImport(CloudKit)
//import CloudKit
//import Wand
//
//public
//struct CloudKit {
//    
//    typealias Model = CloudKit_Model
//    
//}
//
//public
//protocol CloudKit_Model: Model, Pipable {
//
//    static var type: String {get}
//
//    var id: String? {get set}
//
//    var record: CKRecord? {get set}
//
//    init(_ record: CKRecord)
//    init(_ recordID: CKRecord.ID?)
//
//    func updatedRecord() -> CKRecord
//}
//
//public
//extension CloudKit_Model {
//
//    static var type: String {
//        Self.self|
//    }
//
//}
//
//
////GET
//@discardableResult
//func | <S, T: CloudKit.Model> (scope: S,
//                               get: Ask<T>.Get) -> Pipe {
//
//    let pipe = Pipe.attach(to: scope)
//    guard pipe.ask(for: get) else {
//        return pipe
//    }
//
//    pipe | .get { (record: CKRecord) in
//
//        let model = T(record)
//        pipe.put(model)
//
//    }
//    
//    return pipe
//}
//
////POST
////https://jsonplaceholder.typicode.com/posts
//@discardableResult
//func | <T: CloudKit.Model> (postItem: T,
//                            post: Ask<T>.Post) -> Pipe {
//
//    let pipe = postItem.pipe
//    guard pipe.ask(for: post) else {
//        return pipe
//    }
//    
//    pipe.store([postItem.updatedRecord()])
//
//    let o: CKModifyRecordsOperation = pipe.get()
//    o.modifyRecordsResultBlock = { result in
//        
//        switch result {
//            
//            case .success():
//                pipe.put(postItem)
//            
//            case .failure(let e):
//                pipe.put(e)
//     
//        }
//        
//    }
//    
//    
//    let database: CKDatabase = pipe.get()
//    database.add(o)
//
//    return pipe
//}
//
//#endif
