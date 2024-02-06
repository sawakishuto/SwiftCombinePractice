import UIKit
import Combine

let subject = PassthroughSubject<Int, Never>()

final class SomeObject {
    var value: Int = 0 {
        didSet {
            print("didset value", value * 5)
        }
    }
}

final class Reciever {
    var subscriptions = Set<AnyCancellable>()
    let object = SomeObject()

    init(){
        subject
            .assign(to: \.value, on: object)
            .store(in: &subscriptions)
    }
}

let reciever = Reciever()
subject.send(1)
subject.send(2)
