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

#if canImport(Vision)
import CoreMedia.CMSampleBuffer
import Vision.VNObservation
import Wand

/// Ask
///
/// |{ (hands: [VNHumanHandPoseObservation]) in
///
/// }
///
/// URL(string: "http://example.com/image.jpg") | { (faces: [VNFaceObservation]) in
///
/// }
///
/// data | .while { (bodies: [VNHumanBodyPoseObservation]) in
///     bodies < 2
/// }
///
public
protocol VisionObservationAsking: Asking, Wanded {

    associatedtype Request: VNRequest

}

@available(macOS 11.0, iOS 14.0, tvOS 14.0, *)
public
extension VisionObservationAsking {

    static func wand<T>(_ wand: Wand, asks ask: Ask<T>) {

        guard wand.answer(the: ask) else {
            return
        }

        let perform = { (handler: VNImageRequestHandler) in
            let request: Request = wand.obtain()

            try! handler.perform([request])
            if let results = request.results, !results.isEmpty {
                wand.add(results as! [Self])
            } else {
                wand.close()
            }
        }

        //There is request handler already?
        if let handler: VNImageRequestHandler = wand.get() {
            perform(handler)
        } else {

            
            #if !os(visionOS)

                if #available(tvOS 17.0, *) {

                    //Otherwise wait for buffer
                    wand | { (buffer: CMSampleBuffer) in

                        let request = VNImageRequestHandler(cmSampleBuffer: buffer)
                        perform(request)
                    }

                } else {
                    //TODO: Fallback on earlier versions
                }

            #endif
        }
    }

}

@available(macOS 11.0, iOS 14.0, tvOS 14.0, *)
extension VNFaceObservation: VisionObservationAsking {

    public
    typealias Request = VNDetectFaceRectanglesRequest

}

@available(macOS 11.0, iOS 14.0, tvOS 14.0, *)
extension VNBarcodeObservation: VisionObservationAsking {

    public
    typealias Request = VNDetectBarcodesRequest

}

@available(macOS 11.0, iOS 14.0, tvOS 14.0, *)
extension VNHumanHandPoseObservation: VisionObservationAsking {

    public
    typealias Request = VNDetectHumanHandPoseRequest

    static func | (piped: VNHumanHandPoseObservation,
                   joint: JointName) -> CGPoint {
        let recognized = try! piped.recognizedPoint(joint)
        return CGPoint(x: recognized.location.x, y: 1 - recognized.location.y)
    }

}

@available(macOS 11.0, iOS 14.0, tvOS 14.0, *)
extension VNHumanBodyPoseObservation: VisionObservationAsking {

    public
    typealias Request = VNDetectHumanBodyPoseRequest

}

@available(macOS 11.0, iOS 14.0, tvOS 14.0, *)
extension VNClassificationObservation: VisionObservationAsking {

    public
    typealias Request = VNClassifyImageRequest

}

#endif
