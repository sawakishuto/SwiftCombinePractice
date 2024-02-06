import UIKit
import Combine

let subject = PassthroughSubject<String, Never>()

final class Reciever {
    let subscription1: AnyCancellable
    let subscription2: AnyCancellable
    init() {
       subscription1 = subject
            .sink { value in
                print("[1]Recieved value:", value)
            }
        subscription2 = subject
            .sink { value in
                print("[2]Recieved value", value)
            }
    }
}

let reciever = Reciever()
subject.send("にゃん")
reciever.subscription2.cancel()
subject.send("ウェイ")

