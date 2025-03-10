let n = Int(readLine()!)!
var scores = [Int]()
for _ in 0..<n {
    scores.append(Int(readLine()!)!)
}
scores.reverse()
var answer = 0
for idx in scores.indices {
    guard idx != 0 else { continue }
    if scores[idx] >= scores[idx - 1] {
        answer += scores[idx] - (scores[idx - 1] - 1)
        scores[idx] = scores[idx - 1] - 1
    }
}
print(answer)
