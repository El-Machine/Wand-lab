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

#if canImport(AVFoundation)
    import AVFoundation
#endif

#if canImport(Contacts)
    import Contacts
#endif

#if canImport(CoreBluetooth)
    import CoreBluetooth
#endif

#if canImport(CoreLocation)
    import CoreLocation
#endif

#if canImport(CoreNFC)
    import CoreNFC
#endif

#if canImport(Vision)
    import Vision
#endif

import SwiftUI
import Wand
import Wand_Tools

@available(tvOS 13, watchOS 6, *)
struct ContentView: View {

    var body: some View {


        Text("Hello, Wand |").onAppear {

//            let urlString = "https://en.wikipedia.org/wiki/Laozi"
//
//            let wand: Wand = [[CNContactFamilyNameKey as CNKeyDescriptor]]

            //1. While location
//            wand | .while { (l: CLLocation, i: Int) in
//
//                print("1. \(l)")
//
//                print("1. 🎲 \(i)")
//
//                return i != 4
//            } |
//
//            //2. Every location
//            |{ (l: CLLocation) in
//
//                print("2. \(l)")
//
//            } //|
//
            //3. One location
            |.one { (c: CLLocation) in

                print("3. \(c)")

            } //|
//
//            //4.1 One status
//            { (s: CLAuthorizationStatus) in
//
//                print("4.1 \(s)")
//
//            } |
//
//            //4.2 Request authorizedAlways
//            CLAuthorizationStatus.authorizedAlways | .one { (s: CLAuthorizationStatus) in
//
//                print("4.2 \(s)")
//
//            } |
//
//            //5. Find contact
//            .while { (c: CNContact) in
//
//                print("5️⃣ \(c)")
//                return c.familyName != "Higgins"
//
//            } |
//
//            //7. One face
//            |.one { (f: VNFaceObservation) in
//
//                print("7️⃣ \(f)")
//
//            } |
//
//            |.one { (message: NFCNDEFMessage) in    //6️⃣ NFC read
//
//                print("|6️⃣ \(message)")
//
//            } |
//
//            |Ask<NFCNDEFTag>.one().write(urlString|) { tag in
//                
//                print(tag)
//
//            } |
//
//            .any {                                  //.. Notify
//                print("|📦 Did add \($0)")
//            } |
//
//            .all {                                  //.. Completion
//                print("Last")
//            } |
//
//            { (e: Error) in                         //.. Error handling
//                print(e)
//
//            }
//
//            |
//                .retrieve { (peripherals: [CBPeripheral]) in
//                    print()
//                }
//
//
//            let wand = |{ (observations: [VNHumanBodyPoseObservation]) in
//
//                observations.forEach {
//                    print(try! $0.recognizedPoint(.leftWrist))
//                }
//            }
//
//        let wand = |{ (observations: [VNHumanHandPoseObservation]) in
//
//            DispatchQueue.main.sync {
//                self.viewT.forEach{
//                    $0.removeFromSuperview()
//                }
//                self.viewT.removeAll()
//            }
//
//            observations.forEach {
//
//                let point = $0 | .wrist
//                guard let converted = preview?.layerPointConverted(fromCaptureDevicePoint: point) else {
//                    return
//                }
//
//
//                DispatchQueue.main.sync {
//
//                    let view = UIView(frame: (0,0,20,20)|)
//                    view.center = converted
//                    view.backgroundColor = .red
//
//
//                    UIApplication.shared.visibleViewController?.view.addSubview(view)
//
//                    self.viewT.append(view)
//                }
//            }
//        }
//
//            let request: VNDetectHumanHandPoseRequest = wand.obtain()
//            request.maximumHandCount = 2
//
//            let preview = wand.obtain() as AVCaptureVideoPreviewLayer
//            preview.frame = UIScreen.main.bounds
//
//            UIApplication.shared.visibleViewController?.view.layer.addSublayer(preview)
//
        }

    }

}

@available(tvOS 13, watchOS 6, *)
#Preview {
    ContentView()
}
