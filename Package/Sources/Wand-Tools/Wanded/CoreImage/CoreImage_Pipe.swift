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

#if canImport(UIKit) && canImport(CoreImage)
import UIKit.UIImage

public struct Barcode {

    public enum Generator: String {
        case code128 = "CICode128BarcodeGenerator"
        case pdf417 = "CIPDF417BarcodeGenerator"
        case aztec = "CIAztecCodeGenerator"
        case qr = "CIQRCodeGenerator"
    }

    public typealias Colors = (foreground: UIColor?, background: UIColor?)

}

public func |(string: String?, type: Barcode.Generator) -> UIImage? {
    string?.data(using: .ascii) | type
}

public func |(string: String?, to: (type: Barcode.Generator,
                                   size: CGSize?,
                                   colors: Barcode.Colors?)) -> UIImage? {
    string?.data(using: .ascii) | to
}

public func |(data: Data?, type: Barcode.Generator) -> UIImage? {
    data | (type: type, nil, nil)
}

public func |(data: Data?, to: (type: Barcode.Generator,
                                 size: CGSize?,
                                 colors: Barcode.Colors?)) -> UIImage? {

    guard let filter = CIFilter(name: to.type.rawValue) else {
        return nil
    }
    filter.setValue(data, forKey: "inputMessage")

    guard var ciImage = filter.outputImage else {
        return nil
    }

    if let colors = to.colors {
        ciImage = ciImage.applyingFilter("CIFalseColor", parameters: [
            "inputColor0": CIColor(color: colors.foreground ?? .black),
            "inputColor1": CIColor(color: colors.background ?? .white)
        ])
    }


    if let size = to.size {

        let imageSize = ciImage.extent.size

        let transform = CGAffineTransform(scaleX: size.width / imageSize.width,
                                          y: size.height / imageSize.height)
        ciImage = ciImage.transformed(by: transform)

    }

    return UIImage(ciImage: ciImage)
}

#endif
