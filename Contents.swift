import UIKit
import Combine

enum MyError: Error {
    case failed
}

let subject = PassthroughSubject<String, MyError>()

subject
    .sink(receiveCompletion: { completion in
        print("完了！！", completion)
    }, receiveValue: { value in
        print("値を受け取りました：", value)
    })
subject.send("にゃ")
subject.send("にょ")
subject.send(completion: .failure(.failed))

