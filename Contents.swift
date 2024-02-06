import UIKit
import Combine
import Foundation

let subject = PassthroughSubject<String, Never>()

let publisher = subject.eraseToAnyPublisher()

final class Receiver {
    var subscription = Set<AnyCancellable>()

    init() {
        publisher
            .sink { value in
                print("received value", value)
            }
            .store(in: &subscription)
    }
}

let receiver = Receiver()
subject.send("a")
subject.send("b")
subject.send("c")
subject.send("d")

