import UIKit
import Combine

let subject = PassthroughSubject<String, Never>()

final class Reciever {
    let subscription: AnyCancellable
    init() {
       subscription = subject
            .sink { value in
                print("Recieved value:", value)
            }
    }
}

let reciever = Reciever()
subject.send("にゃん")
reciever.subscription.cancel()
subject.send("ウェイ")

