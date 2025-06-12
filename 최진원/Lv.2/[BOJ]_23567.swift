// https://www.acmicpc.net/problem/23567

func push(_ color: Int) {
    isContainedIn[color] += 1
    if isContainedIn[color] == 1 {
        inColorCount += 1
    }
    isContainedOut[color] -= 1
    if isContainedOut[color] == 0 {
        outColorCount -= 1
    }
}
func pop(_ color: Int) {
    isContainedOut[color] += 1
    if isContainedOut[color] == 1 {
        outColorCount += 1
    }
    isContainedIn[color] -= 1
    if isContainedIn[color] == 0 {
        inColorCount -= 1
    }
}

let nk = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, k) = (nk[0], nk[1])
var p = [Int]()
for _ in 0..<n {
    p.append(Int(readLine()!)!)
}
var isContainedIn = [Int](repeating: 0, count: k + 1)
var isContainedOut = [Int](repeating: 0, count: k + 1)
for color in p {
    isContainedOut[color] += 1
}
var (inColorCount, outColorCount) = (0, k)
var (start, end) = (0, 0)
var isAvailable = false
var answer = Int.max
push(p[start])
while true {
    if inColorCount < k {
        guard end + 1 < n else { break }
        end += 1
        push(p[end])
    } else if inColorCount == k && outColorCount < k {
        pop(p[start])
        start += 1
    } else if inColorCount == k && outColorCount == k {
        answer = min(answer, end - start + 1)
        pop(p[start])
        start += 1
    }
}
print(answer == Int.max ? 0 : answer)
