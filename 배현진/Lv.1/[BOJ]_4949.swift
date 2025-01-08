// https://www.acmicpc.net/problem/4949

var input = ""

while true {
    input = readLine()!
    if input == "." {
        break
    }
    var stack: [Character] = []

    for i in input {
        if i == "(" || i == ")" || i == "[" || i == "]" {
            if (stack.last == "(" && i == ")") || (stack.last == "[" && i == "]") {
                stack.removeLast()
            } else {
                stack.append(i)
            }
        }
    }

    print(stack.isEmpty ? "yes" : "no")
}

/*
 var stack: [Character] = [] 부분을 while문 밖에서 선언하고,
 while문 안에서 stack.removeAll() 해주는 방식을 사용했을 경우, 시간이 약 10ms 정도 더 소요됐다.
 */

/*
 i 값이 특정 문자열(여기서는 조건으로 주어진 괄호들) 배열에 속한 경우를 판단하는 방법이
 or을 이용해 하나씩 확인하는 방식보다 시간이 더 소요됐다.
 */
