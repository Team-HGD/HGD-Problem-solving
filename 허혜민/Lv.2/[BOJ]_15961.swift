// https://www.acmicpc.net/problem/15961
import Foundation

let file = FileIO()

let n = file.readInt()
let d = file.readInt()
let k = file.readInt()
let c = file.readInt()

var belt = [Int]()
for _ in 0..<n {
    belt.append(file.readInt())
}

var window: [Int: Int] = [:]
window[c] = 1
belt[0..<k].forEach{ window[$0, default: 0] += 1 }
var ans = window.keys.count

for i in 1..<n {
  let left = i 
  let right = (i + k - 1) % n 
  window[belt[left-1], default: 0] -= 1 
  window[belt[left-1]] = window[belt[left-1]] == 0 ? nil : window[belt[left-1]]
  window[belt[right], default: 0] += 1
  ans = max(ans, window.keys.count)
}

print(ans)


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
