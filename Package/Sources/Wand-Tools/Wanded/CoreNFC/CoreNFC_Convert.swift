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

#if canImport(CoreNFC)
import CoreNFC
import Wand

@inline(__always)
@available(iOS 13.0, *)
public
postfix func |(url: URL) -> NFCNDEFMessage {
    NFCNDEFMessage(records: [.wellKnownTypeURIPayload(url: url)!])
}

@inline(__always)
@available(iOS 13.0, *)
public
postfix func |(url: URL?) -> NFCNDEFMessage {
    NFCNDEFMessage(records: [.wellKnownTypeURIPayload(url: url!)!])
}

@inline(__always)
@available(iOS 13.0, *)
public
postfix func |(content: String) -> NFCNDEFMessage {
    NFCNDEFMessage(records: [.wellKnownTypeURIPayload(string: content)!])
}

@inline(__always)
@available(iOS 13.0, *)
public
postfix func |(content: String?) -> NFCNDEFMessage {
    NFCNDEFMessage(records: [.wellKnownTypeURIPayload(string: content!)!])
}

@inline(__always)
@available(iOS 13.0, *)
public
postfix func |(piped: NFCNDEFMessage?) -> URL? {
    piped?.records.first?.wellKnownTypeURIPayload()
}

@inline(__always)
@available(iOS 13.0, *)
public
postfix func |(piped: NFCNDEFMessage) -> URL? {
    piped.records.first?.wellKnownTypeURIPayload()
}

@available(iOS 13.0, *)
public
extension Wand.Error {

    static func nfc(_ reason: String) -> Error {
        NFCReaderError.init(.readerErrorInvalidParameter,
                            userInfo: [NSLocalizedDescriptionKey: reason])
    }

}

#endif
