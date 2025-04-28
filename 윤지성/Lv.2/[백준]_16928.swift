// https://www.acmicpc.net/problem/16928

import Foundation


let input = readLine()!.split(separator: " ").compactMap{ Int(String($0))}
let ladderCnt = input[0]
let snakeCnt = input[1]
var boards: [Int] = Array(repeating: 0, count: 101)
var playingNote: [Int] = Array(repeating: Int.max, count: 101)

for _ in 0..<ladderCnt {
    let input = readLine()!.split(separator: " ").compactMap{ Int(String($0))}
    boards[input[0]] = input[1]
}

for _ in 0..<snakeCnt {
    let input = readLine()!.split(separator: " ").compactMap{ Int(String($0))}
    boards[input[0]] = input[1]
}
var posistions: [Int] = [1] // 예비 마지막 위치들을 기억하는 배열
playingNote[1] = 0

while posistions.isEmpty {
    var temp: [Int] = []
    for pos in posistions {
        for i in 1...6 {
            var newPosistion = pos + i
            guard newPosistion <= 100 else { continue }
            if boards[pos + i] != 0 { // 뱀이나 사다리가 있는 경우
               newPosistion = boards[pos + i]
            }
            if playingNote[newPosistion] > playingNote[pos] + 1 { // 이동횟수가 적은 경우 바꾸기
               playingNote[newPosistion] = playingNote[pos] + 1
               temp.append(newPosistion)
            }
        }
        posistions = temp // 탐색할 위치 업데이트
    }
}
print(playingNote[100])
