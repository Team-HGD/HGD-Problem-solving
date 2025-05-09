// https://www.acmicpc.net/problem/2295

func binarySearch(_ target: Int) -> Bool {
    var low = 0
    var high = xySumArray.count - 1
    while low <= high {
        let mid = (low + high) / 2
        if xySumArray[mid] == target {
            return true
        } else if xySumArray[mid] < target {
            low = mid + 1
        } else if xySumArray[mid] > target {
            high = mid - 1
        }
    }
    return false
}

let n = Int(readLine()!)!
var u = [Int]()
for _ in 0..<n {
    u.append(Int(readLine()!)!)
}
var xySumArray = [Int]()
var answer = 0
for i in u.indices {
    for j in u.indices {
        xySumArray.append(u[i] + u[j])
    }
}
u.sort { $0 < $1 }
xySumArray.sort { $0 < $1 }
for i in 0..<n {
    for j in 0..<i {
        let xySum = u[i] - u[j]
        guard xySum > 0 else { continue }
        if binarySearch(u[i] - u[j]) {
            answer = u[i]
            break
        }
    }
}
print(answer)
