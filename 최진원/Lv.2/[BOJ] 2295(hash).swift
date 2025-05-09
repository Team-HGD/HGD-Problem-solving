// https://www.acmicpc.net/problem/2295

let n = Int(readLine()!)!
var u = [Int]()
for _ in 0..<n {
    u.append(Int(readLine()!)!)
}
u.sort { $0 < $1 }
var sumTwoSet = Set<Int>()
var answer = 0
for i in u.indices {
    for j in u.indices {
        sumTwoSet.insert(u[i] + u[j])
    }
}
for i in 0..<n {
    for j in 0..<i {
        if sumTwoSet.contains(u[i] - u[j]) {
            answer = u[i]
            break
        }
    }
}
print(answer)
