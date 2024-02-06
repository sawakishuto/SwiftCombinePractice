import UIKit
import Combine

let publisher = (1...5).publisher

final class Reciever {
    var subscriptions = Set<AnyCancellable>()

    init() {
        publisher
            .sink { completion in
                print("完了", completion)
            } receiveValue: { value in
                print("受け取った値", value)
            }
            .store(in: &subscriptions)

    }
}

let reciever = Reciever()
