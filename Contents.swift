import UIKit
import Combine
import Foundation

let subject = PassthroughSubject<String, Never>()

let publisher = subject.eraseToAnyPublisher()

final class Sender {
    @Published var event: String = "A"
}
let sender = Sender()

final class Receiver {
    var subscription = Set<AnyCancellable>()

    init() {
        print("インスタンス生成")
        sender.$event
            .sink { value in
                print("received value", value)
            }
            .store(in: &subscription)
    }
}

let receiver = Receiver()
sender.event = "B"

