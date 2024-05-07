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
//extension CKQueryOperation: Constructable {
//
//    public static func construct(in pipe: Pipe) -> Self {
//
//        let config: CKOperation.Configuration   = pipe.get()
//        let query: CKQuery                      = pipe.get()
//
//        let operation = CKQueryOperation(query: query)
//        operation.configuration = config
//        operation.cursor = pipe.get()
//
//        var records = [CKRecord]()
//
//        operation.recordMatchedBlock = { id, result in
//
//            switch result {
//                
//                case .success(let record):
//                    records.append(record)
//                
//                    //Ignore partial errors
////                case .failure(let e):
////                    pipe.put(e)
//
//                default:
//                    break
//
//            }
//            
//        }
//
//        operation.queryResultBlock = { result in
//
//            switch result {
//
//                case .success(let cursor):
//                    pipe.put(records)
//                    pipe.put(cursor)
//
//                case .failure(let e):
//                    pipe.put(e)
//
//            }
//
//
//
//        }
//
//        return operation as! Self   
//    }
//
//}
//
//#endif
