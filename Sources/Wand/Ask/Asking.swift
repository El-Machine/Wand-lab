/// Copyright © 2020-2024 El Machine 🤖 (http://el-machine.com/)
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.
///
/// Created by Alex Kozin
///

/// Ask from Context
public
protocol Asking {

    //static func | (wand: Wand, ask: Ask<Self>)
    @inline(__always)
    static func wand<T>(_ wand: Wand, asks: Ask<T>)

}

/// Ask
///
/// any | { T in
///
/// }
/// 
@inline(__always)
@discardableResult
public func |<C, T: Asking> (context: C?, handler: @escaping (T)->() ) -> Wand {
    Wand.attach(to: context) | Ask.every(handler: handler)
}

/// Ask
/// - `every`
/// - `one`
/// - `while`
///
/// any | .one { T in
///
/// }
///
@inline(__always)
@discardableResult
public func |<C, T: Asking> (context: C?, ask: Ask<T>) -> Wand {
    Wand.attach(to: context) | ask
}

/// Ask
///
/// wand | .every { T in
///
/// }
///
@inline(__always)
@discardableResult
public func |<T: Asking> (wand: Wand, ask: Ask<T>) -> Wand {
    T.wand(wand, asks: ask)
    return wand
}

/// Ask without handler
///
/// Foo.one | Bar.every | { (error: Error) in
///
/// }
///
public
extension Asking {

    @inline(__always)
    static var every: Ask<Self> {
        .every()
    }

    @inline(__always)
    static var one: Ask<Self> {
        .one()
    }
    
}
