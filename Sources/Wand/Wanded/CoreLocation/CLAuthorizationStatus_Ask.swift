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

import CoreLocation.CLLocation

/// Ask
///
/// |{ (permissions: CLAuthorizationStatus) in
///
/// }
///
/// CLAuthorizationStatus.authorizedAlways | { (scope: CLAuthorizationStatus) in
///
/// }
extension CLAuthorizationStatus: AskingNil, Wanded {

    @inline(__always)
    public
    static func wand<T>(_ wand: Wand, asks ask: Ask<T>) {

        //Save ask
        guard wand.answer(the: ask) else {
            return
        }

        //Request for a first time

        //Prepare context
        let source: CLLocationManager       = wand.obtain()
        let asking: CLAuthorizationStatus?  = wand.get()

        //Make request
        switch asking {

            #if !APPCLIP
                case .authorizedAlways:
                    source.requestAlwaysAuthorization()
            #endif

            case .none, .authorizedWhenInUse:
                source.requestWhenInUseAuthorization()

            default:
                break
        }

    }

}

@inline(__always)
@discardableResult
public
func | (request: CLAuthorizationStatus, handler: @escaping (CLAuthorizationStatus)->() ) -> Wand {
    Wand(for: request) | .every(handler: handler)
}

@inline(__always)
@discardableResult
public
func | (request: CLAuthorizationStatus, ask: Ask<CLAuthorizationStatus> ) -> Wand {
    Wand(for: request) | ask
}

