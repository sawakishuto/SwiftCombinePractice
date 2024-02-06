import UIKit
import Combine
import Foundation

let publisher = Timer.publish(every: 1, on: .main, in: .common)

final class Reciever {
    var subscriptions = Set<AnyCancellable>()

    init() {
        publisher
            .autoconnect()
            .sink { value in
                print("受け取ったよ", value)
            }
            .store(in: &subscriptions)

    }
}

let reciever = Reciever()
