import UIKit
import Combine
import Foundation

let myNotification = Notification.Name("myNotification")
let publisher = NotificationCenter.default.publisher(for: myNotification)

final class Receiver {
    var subscription = Set<AnyCancellable>()

    init() {
        publisher
            .sink { value in
                print("受け取った", value)
            }
            .store(in: &subscription)
    }
}

let receiver = Receiver()
print("スタート")
DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
    NotificationCenter.default.post(Notification(name: myNotification))
}

