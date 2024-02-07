import UIKit
import Combine
import Foundation

final class Model {
    let subjectX = PassthroughSubject<String, Never>()
    let subjectY = PassthroughSubject<String, Never>()
}
let model = Model()

final class ViewModel {
    var text: String = "" {
        didSet {
            print("didset text", text)
        }
    }
}

final class Receiver {
    var subscriptions = Set<AnyCancellable>()
    let viewModel = ViewModel()
    let formatter = NumberFormatter()

    init() {
        model.subjectX
            .combineLatest(model.subjectY)
            .map{ valueX, valueY in
                "X: " + valueX + "Y: " + valueY
            }
            .assign(to: \.text, on: viewModel)
            .store(in: &subscriptions)
    }
}

let receive = Receiver()
model.subjectX.send("1")
model.subjectY.send("2")
