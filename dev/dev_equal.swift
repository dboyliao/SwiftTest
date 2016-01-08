import Foundation

enum TestingError: ErrorType {
    case NotEqualError(message: String)
    case AssertionError(message: String)
}

func equal<T:Equatable>(label: String, codeBlock: () -> T, answer:T) throws {

    NSLog("%@", label)

    let start = NSDate()
    defer {
        let end = NSDate()
        let duration = end.timeIntervalSinceDate(start)
        NSLog("%@ takes %5.3g seconds.", label, duration)
    }

    let result = codeBlock()

    if result != answer {
        throw TestingError.NotEqualError(message:"Output: \(result)\nExpect: \(answer).")
    }

}

func testEqual<T:Equatable>(label: String, codeBlock:() -> T, answer: T) {

    do {
        try equal(label, codeBlock: codeBlock, answer:answer)
    } catch TestingError.NotEqualError(let message){

        print(message)

    } catch {

        print("Uncatched Error....")

    }

}

func test1() -> String {

    return "answer"

}

testEqual("Test1", codeBlock: test1, answer: "answer")
testEqual("Test2", codeBlock: test1, answer: "wrong answer")
