import UIKit
import Combine
import Foundation

let url = URL(string: "https://www.example.com")!
let publisher = URLSession.shared.dataTaskPublisher(for: url)

final class Receiver {
    var subscriptions = Set<AnyCancellable>()

    init() {
        publisher
            .sink { completion in
                if case let .failure(error) = completion{
                    print("received error", completion)
                } else {
                    print("recieved completion", completion)
                }

            } receiveValue: { data, responce in
                print("received data", data)
                print("received response", responce)
            }
            .store(in: &subscriptions)

    }
}

let receiver = Receiver()
