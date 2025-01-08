// https://www.acmicpc.net/problem/9935
func main_9935() {
    var stack: [String] = []
    let word = readLine()!.map{ String($0) }
    let bomb = readLine()!.map{ String($0) }
    let bombCount = bomb.count
    for char in word {
        stack.append(char)

        if char == bomb[bombCount-1],
           stack.count >= bombCount {
            // stack 내 폭발 문자열인지 확인
            let compared = stack[stack.count-bombCount...stack.count-1].map{ String($0) }
            if compared == bomb {
                for _ in 0..<bombCount {
                    stack.popLast()
                }
            }
        }
    }
    print(stack.isEmpty ? "FRULA" : stack.joined())
}
main_9935()
