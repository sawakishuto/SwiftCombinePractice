import UIKit
import Combine

let subject = PassthroughSubject<String, Never>()

subject
    .sink(receiveCompletion: { completion in
        print("完了！！", completion)
    }, receiveValue: { value in
        print("値を受け取りました：", value)
    })
subject.send("にゃ")
subject.send("にょ")
subject.send(completion: .finished)

