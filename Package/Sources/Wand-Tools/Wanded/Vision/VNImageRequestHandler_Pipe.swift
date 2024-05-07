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
import Vision.VNRequest
import CoreGraphics.CGImage
import CoreImage.CIImage
import Wand

extension VNImageRequestHandler: Obtain {

    public static func obtain(by wand: Wand?) -> Self {

        guard let wand else {
            fatalError()
        }

        let orientation: CGImagePropertyOrientation = wand.get() ?? .up
        let options: [VNImageOption : Any] = wand.get() ?? [:]

        let request: Self
        if let buffer: CMSampleBuffer = wand.get() {
            if #available(iOS 14.0, macOS 11.0, tvOS 14, *) {
                request = Self(cmSampleBuffer: buffer,
                               orientation: orientation,
                               options: options)
            } else {
                fatalError()
            }

            return wand.add(request)
        }

        if let pixelBuffer: CVPixelBuffer = wand.get() {
            if #available(iOS 14.0, macOS 11.0, *) {
                request = Self(cvPixelBuffer: pixelBuffer,
                               orientation: orientation,
                               options: options)
            } else {
                fatalError()
            }

            return wand.add(request)
        }

        if let image: CGImage = wand.get() {
            request = Self(cgImage: image,
                           orientation: orientation,
                           options: options)

            return wand.add(request)
        }


        if let image: CIImage = wand.get() {
            request = Self(ciImage: image,
                           orientation: orientation,
                           options: options)

            return wand.add(request)
        }


        if let data: Data = wand.get() {
            request = Self(data: data,
                           orientation: orientation,
                           options: options)

            return wand.add(request)
        }

        if let url: URL = wand.get() {
            request = Self(url: url,
                           orientation: orientation,
                           options: options)

            return wand.add(request)
        }


        fatalError( """
                    🔥 It's yet not possible to construct
                    \(self)
                    """)
    }

}

#endif
