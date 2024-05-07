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
//extension CKContainer: Constructable {
//
//    public static func construct(in pipe: Pipe) -> Self {
//        Self.default() as! Self
//    }
//
//}
//
//extension CKDatabase: Constructable {
//
//    public static func construct(in pipe: Pipe) -> Self {
//        let container: CKContainer = pipe.get()
//        return container.publicCloudDatabase as! Self
//    }
//
//}
//
//extension CKRecord.ID: Constructable {
//
//    public static func construct(in pipe: Pipe) -> Self {
//        
//        if let int: Int = pipe.get() {
//            return Self.init(recordName: int|)
//        }
//        
//        return Self.init(recordName: pipe.get()!)
//    }
//
//}
//
//extension CKOperation.Configuration: Constructable {
//
//    public static func construct(in pipe: Pipe) -> Self {
//
//        let config = Self()
//        config.isLongLived = true
//        config.qualityOfService = .default
//
//        return config
//    }
//
//}
//
//extension CKQuery: Constructable {
//
//    public static func construct(in pipe: Pipe) -> Self {
//
//        let q = CKQuery(
//            recordType: pipe.get()!,
//            predicate: pipe.get()!
//        )
//
//        q.sortDescriptors = pipe.get()
//        return q as! Self
//    }
//
//}
//
//#endif
