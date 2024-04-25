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

import Contacts.CNContact

/// Ask
///
/// |{ (contact: CNContact) in
///
/// }
///
/// CNContact.predicateForContacts(matchingName: "John Appleseed")
/// | .every { (contact: CNContact) in
///
/// }
extension CNContact: AskingNil, Wanded  {

    @inline(__always)
    public
    static func wand<T>(_ wand: Wand, asks ask: Ask<T>) {

        //Save ask
        guard wand.answer(the: ask) else {
            return
        }

        //Request for a first time

        //Prepare context
        let source: CNContactStore  = wand.obtain()
        let keys: [CNKeyDescriptor] = wand.get() ?? []
        
        //Set the cleaner
//        wand.setCleaner(for: T.self)

        //Make request
        source.requestAccess(for: .contacts) { granted, error in
            guard granted else {
                return
            }

            DispatchQueue.global().async {

                let request = CNContactFetchRequest(keysToFetch: keys)
                request.predicate = wand.get()
                do {
                    try source.enumerateContacts(with: request) { contact, stop in
                        wand.add(contact)
                    }
                } catch {
                    print(error)
                }

            }

        }

    }

}
