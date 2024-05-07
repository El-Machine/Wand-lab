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
//extension CKFetchRecordsOperation: Constructable {
//
//    public static func construct(in pipe: Pipe) -> Self {
//        
//        let id: CKRecord.ID = pipe.get()
//        
//        let config = CKOperation.Configuration()
//        config.isLongLived = true
//        config.qualityOfService = .default
//        
//        let operation = CKFetchRecordsOperation(recordIDs: [id])
//        operation.configuration = config
//        
//        operation.perRecordResultBlock = { id, result in
//            
//            switch result {
//                
//                case .success(let record):
//                    pipe.put(record)
//                
//                case .failure(let e):
//                    pipe.put(e)
//                
//            }
//            
//        }
//        
//        return operation as! Self   
//    }
//
//}
//
//#endif
