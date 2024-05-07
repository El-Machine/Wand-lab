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
//
//#if canImport(CloudKit)
//import CloudKit
//import Wand
//
////POST
////Post item
//@discardableResult
//func | (postItem: CloudKit.Model,
//        post: Ask<CKRecord>.Post) -> Pipe {
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
//////PUT
//////https://jsonplaceholder.typicode.com/posts/42
////@discardableResult
////func | (postItem: JSONplaceholderAPI.Post,
////        put: Ask<JSONplaceholderAPI.Post>.Put) -> Pipeline {
////
////    let pipe = postItem.pipe
////
////    let path = JSONplaceholderAPI.Post.path + "/\(postItem.id)"
////    pipe.store(path)
////
////    pipe.store(Rest.Method.PUT)
////
////    var body: [String: any Hashable] = ["id": postItem.id]
////    if let title = postItem.title {
////        body["title"] = title
////    }
////    if let content = postItem.body {
////        body["body"] = content
////    }
////
////    pipe.store(body| as Data)
////
////    return pipe | put
////}
////
//////DELETE
//////https://jsonplaceholder.typicode.com/posts/42
////@discardableResult
////func | (postItem: JSONplaceholderAPI.Post,
////        delete: Ask<JSONplaceholderAPI.Post>.Delete) -> Pipeline {
////
////    let pipe = postItem.pipe
////
////    let path = JSONplaceholderAPI.Post.path + "/\(postItem.id)"
////    pipe.store(path)
////
////    pipe.store(Rest.Method.DELETE)
////
////    return pipe | delete
////}
//
//#endif
