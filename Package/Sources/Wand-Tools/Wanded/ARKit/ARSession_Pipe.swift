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
//import ARKit.ARSession
//import RealityKit
//
//import Wand
//
//@available(iOS 13.0, *)
//extension ARSession: Constructable {
//
//    public static func construct(in pipe: Pipe) -> Self {
//
//        let arView: ARView = pipe.get()
//
//        let session: Self = arView.session as! Self
//        session.delegate = pipe.put(ARSession.Delegate())
//
//        if let configuration: ARConfiguration = pipe.get() {
//            arView.automaticallyConfigureSession = false
//            session.run(configuration)
//        }
//
//
//        return session
//    }
//
//    class Delegate: NSObject, ARSessionDelegate, Pipable {
//
//        func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
//
//            guard let pipe = isPiped else {
//                return
//            }
//
//            let key: String = Ask<[ARAnchor]>.DidAdd.self|
//            pipe.put(anchors, key: key)
//        }
//
//        func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
//
//            guard let pipe = isPiped else {
//                return
//            }
//
//            let key: String = Ask<[ARAnchor]>.DidUpdate.self|
//            pipe.put(anchors, key: key)
//        }
//
//        func session(_ session: ARSession, didFailWithError error: Error) {
//            isPiped?.put(error)
//        }
//
//    }
//
//}

#endif
