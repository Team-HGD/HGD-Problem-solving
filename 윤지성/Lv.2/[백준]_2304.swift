// https://www.acmicpc.net/problem/2304
import Foundation

let n = Int(readLine()!)!
var blocks: [(Int, Int)] = []
var answer: Int = 0
var maxHeight: Int = 0
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap{ Int(String($0))}
    let left = input[0]
    let height = input[1]
    blocks.append((left, height))
    maxHeight = max(maxHeight, height)
}
blocks.sort{ $0.0 < $1.0 }

var leftIdx: Int = 0
var (priorBlockLeft, priorBlockHeight): (Int, Int) = (0,0)

while true { // 제일 높은 블록을 기준으로 왼쪽 블록 탐색 - 왼쪽에서 오른쪽으로 탐색
    let (nextBlockLeft, nextBlockHeight) = blocks[leftIdx]
    
    if nextBlockHeight > priorBlockHeight {
        answer += priorBlockHeight * (nextBlockLeft - priorBlockLeft) // 크다면 면적 구하여 더하기
        if nextBlockHeight == maxHeight { break } // 제일 높은 블록이면 종료
        (priorBlockLeft, priorBlockHeight) = (nextBlockLeft, nextBlockHeight)
    }
    leftIdx += 1
}

var rightIdx: Int = blocks.count - 1
var (rightBlockRight, rightBlockHeight) = (blocks.last!.0 + 1,0)

while true { // 제일 높은 블록을 기준으로 오른쪽 블록 탐색 - 오른쪽에서 왼쪽으로 탐색
    let (nextBlockRight, nextBlockHeight) = (blocks[rightIdx].0 + 1, blocks[rightIdx].1)
    
    if nextBlockHeight > rightBlockHeight {
        answer += rightBlockHeight * (rightBlockRight - nextBlockRight) // 크다면 면적 구하여 더하기
        if nextBlockHeight == maxHeight { break } // 제일 높은 블록이면 종료
        (rightBlockRight, rightBlockHeight) = (nextBlockRight, nextBlockHeight)
    }
    rightIdx -= 1
}
answer += maxHeight * (blocks[rightIdx].0 - blocks[leftIdx].0 + 1)

print(answer)

