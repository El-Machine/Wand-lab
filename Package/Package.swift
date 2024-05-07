// swift-tools-version: 5.6

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
        .package(url: "http://github.com/El-Machine/Wand.git", from: "0.1.6")
    ],
    targets: [
        .target(
            name: "Wand-Tools",
            dependencies: [
                .product(name: "Wand", package: "Wand")
            ]),
        .testTarget(
            name: "WandTests",
            dependencies: ["Wand-Tools"]),
        .testTarget(
            name: "WatchPlayTests",
            dependencies: ["Wand-Tools"]),
    ]
)
