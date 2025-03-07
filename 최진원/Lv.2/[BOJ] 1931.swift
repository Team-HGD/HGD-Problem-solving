// https://www.acmicpc.net/problem/1931

typealias Meeting = (start: Int, end: Int)

let n = Int(readLine()!)!
var meetings = [Meeting]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    meetings.append((start: input[0], end: input[1]))
}
meetings.sort {
    if $0.end != $1.end {
        return $0.end < $1.end
    } else {
        return $0.start < $1.start
    }
}
var answer = 0
var pointer = 0
var currentTime = 0
while pointer < n {
    if meetings[pointer].start >= currentTime {
        answer += 1
        currentTime = meetings[pointer].end
    }
    pointer += 1
}
print(answer)
