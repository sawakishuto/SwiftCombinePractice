import UIKit
import Combine

let subject = PassthroughSubject<String, Never>()

final class Reciever {
    var subscriptions = Set<AnyCancellable>()
    init() {
        subject
            .sink { value in
                print("[1]Recieved value:", value)
            }
            .store(in: &subscriptions)
         subject
            .sink { value in
                print("[2]Recieved value", value)
            }
            .store(in: &subscriptions)
    }
}

let reciever = Reciever()
subject.send("にゃん")
subject.send("ウェイ")

