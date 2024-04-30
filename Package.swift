// swift-tools-version:5.3
//
//  Copyright (c) 2020-2021 El Machine (http://el-machine.com/)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//
//  Created by Alex Kozin
//  2020 El Machine
//

import PackageDescription

let package = Package(
    name: "Wand-Tools",
    defaultLocalization: "ru",
    platforms: [
        .iOS(.v14), .macOS(.v11), .watchOS(.v4), .tvOS(.v12)
    ],
    products: [
        .library(
            name: "Wand-Tools",
            targets: ["Wand-Tools"]),
    ],
    dependencies: [
        .package(name: "Wand", url: "http://github.com/El-Machine/Wand.git", from: "0.1")
    ],
    targets: [
        .target(
            name: "Wand-Tools",
            dependencies: ["Wand"]),
        .testTarget(
            name: "WandTests",
            dependencies: ["Wand", "Wand-Tools"]),
        .testTarget(
            name: "WatchPlayTests",
            dependencies: ["Wand", "Wand-Tools"]),
    ]
)
