// https://www.acmicpc.net/problem/24337

let nab = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, a, b) = (nab[0], nab[1], nab[2])
var answer = [Int]()
if a >= b {
    // up
    answer = Array(1...a)
    // down
    if b > 1 {
        answer += Array(1...b - 1).reversed()
    }
    // pre
    if n - answer.count > 0 {
        answer = [Int](repeating: 1, count: n - answer.count) + answer
    }
} else {
    // down
    answer += Array(1...b).reversed()
    // up
    if a > 1 {
        answer = Array(1...a - 1) + answer
        if n - answer.count > 0 { 
            answer = [Int](repeating: 1, count: n - answer.count) + answer 
        }
    } else {
        answer.insert(contentsOf: [Int](repeating: 1, count: n - answer.count), at: 1)
    }
}
if answer.count > n { 
    answer = [-1]
}
print(answer.map { String($0) }.joined(separator: " "))
