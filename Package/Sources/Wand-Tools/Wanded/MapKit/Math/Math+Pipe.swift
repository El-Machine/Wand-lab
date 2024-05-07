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

import Foundation
import Wand

extension Bool {

    static public postfix func |<T: Numeric> (value: Self) -> T {
        value ? 1 : 0
    }

}

extension BinaryInteger {

    static public postfix func |(value: Self) -> Double {
        Double(value)
    }

    static public postfix func |(value: Self) -> CGFloat {
        CGFloat(value)
    }

}

extension Double {
    
    static public postfix func |(value: Self) -> Float {
        Float(value)
    }
    
}

extension String {
    
    static public postfix func |(value: Self) -> Int? {
        Int(value) ?? Int(String(value.unicodeScalars.filter(CharacterSet.decimalDigits.inverted.contains)))
    }
    
    static public postfix func |(value: Self) -> Int {
        (value|)!
    }
    
}

extension BinaryFloatingPoint {

    public static postfix func |(value: Self) -> Int {
        Int(value)
    }

}

public postfix func |(value: String?) -> Double? {
    Double(value ?? "")
}
