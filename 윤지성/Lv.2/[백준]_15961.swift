// https://www.acmicpc.net/problem/15961
import Foundation

let file = FileIO()
let n = file.readInt() // 접시 수
let d = file.readInt() // 초밥 가짓수
let k = file.readInt() // 연속해서 먹어야할 초밥 개수
let c = file.readInt() // 쿠폰에 적힌 초밥 번호

var currentSushis: [Int] = Array(repeating: 0, count: d + 1) // 초밥 종류별 개수를 저장하는 배열
var sushis: [Int] = [] // 초밥집 초밥을 순서대로 저장하는 배열
var sum: Int = 0
var answer: Int = 0

// 초밥 리스트 입력
for _ in 0..<n {
    sushis.append(file.readInt())
}
currentSushis[c] = 1
sum += 1

// 초기 `k`개 세팅
for i in 0..<k {
    if currentSushis[sushis[i]] == 0 { sum += 1 }
    currentSushis[sushis[i]] += 1
}
// 쿠폰 초밥 확인
answer = sum

var lft: Int = 0
var rgt: Int = k

while lft < n {
    let outSushi = sushis[lft]
    currentSushis[outSushi] -= 1 // 한칸씩 이동하면서 맨 처음 초밥 제외하기
    if currentSushis[outSushi] == 0 { sum -= 1}
    
    let inSushi = sushis[rgt % n]
    if currentSushis[inSushi] == 0 { sum += 1}
    currentSushis[inSushi] += 1 // 한칸씩 이동하면서 뒷 초밥 포함하기
  
    answer = max(answer, sum)

    lft += 1
    rgt += 1
}
print(answer)

final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시

        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }

    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시

        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return Array(buffer[beginIndex..<(index-1)])
    }
}
