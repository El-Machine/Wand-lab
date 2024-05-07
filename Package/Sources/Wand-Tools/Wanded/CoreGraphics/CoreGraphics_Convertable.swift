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

import CoreGraphics
import Wand

//CGPoint
public postfix func |(p: (x: CGFloat, y: CGFloat)) -> CGPoint {
    CGPoint(x: p.0, y: p.1)
}

public postfix func |(value: Int) -> CGPoint {
    CGPoint(x: value, y: value)
}

//CGRect
public postfix func |(p: (x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat)) -> CGRect {
    CGRect(x: p.0, y: p.1, width: p.2, height: p.3)
}

public postfix func |(size: CGSize) -> CGRect {
    CGRect(origin: .zero, size: size)
}

//CGSize
public postfix func |(p: CGFloat) -> CGSize {
    CGSize(width: p, height: p)
}

public postfix func |(p: (width: CGFloat, height: CGFloat)) -> CGSize {
    CGSize(width: p.0, height: p.1)
}

public postfix func |(p: (width: Int, height: Int)) -> CGSize {
    CGSize(width: CGFloat(p.0), height:  CGFloat(p.1))
}
