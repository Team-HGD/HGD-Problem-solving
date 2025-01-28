// https://school.programmers.co.kr/learn/courses/30/lessons/72410
import Foundation

func solution(_ new_id:String) -> String {
    var idArr = Array(new_id.lowercased()).map{ String($0)}
    var answerId: [String] = []
    var lastChar: String = ""
    for (idx, char) in idArr.enumerated() {
        if answerId.isEmpty {
            if isPeriod(char) { continue }
        } else {
            if isPeriod(char) && isPeriod(lastChar) { continue }
        }
        if isUnAcceptedCharacter(char) { continue }
        answerId.append(char)
        lastChar = char
    }
    while answerId.count > 15 {
        let _ = answerId.popLast()
    }
    if let lastElement = answerId.popLast() {
        if !isPeriod(lastElement) {
            answerId.append(lastElement)
        }
    }
    if answerId.count == 0 { answerId.append("a") }
    if answerId.count < 3 {
        let lastElement = answerId.removeLast()
        while answerId.count < 3 {
            answerId.append(lastElement)
        }
    }
    return answerId.joined(separator: "")
}

func isUnAcceptedCharacter(_ input: String) -> Bool {
    switch input {
        case "_", "-", ".":
        return false
        case "~", "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "=", "+", "[", "{", "]", "}", ":", "?", ",", "<", ">", "/":
        return true
        default:
        return false
    }
}
func isPeriod(_ input: String) -> Bool {
    input == "."
}
