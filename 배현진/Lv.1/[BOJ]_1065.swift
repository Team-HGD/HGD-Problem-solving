// https://www.acmicpc.net/problem/1065

let n = Int(readLine()!)!
var result: Int = 99

if n < 100 {
    print(n)
} else {
    for i in 100...n {
        let num = "\(i)".map { Int(String($0))! }
        if num[1] - num[0] == num[2] - num[1] {
            result += 1
        }
    }
    print(result)
}

// 처음 풀이
//let n = Int(readLine()!)!
//var onesPlace: Int = 0
//var tensPlace: Int = 0
//var hundredsPlace: Int = 0
//var result: Int = 99
//
//if n < 100 {
//    print(n)
//} else {
//    for i in 100...n {
//        onesPlace = i % 10
//        tensPlace = i / 10 % 10
//        hundredsPlace = i / 100
//
//        if hundredsPlace - tensPlace == tensPlace - onesPlace {
//            result += 1
//        }
//    }
//    print(result)
//}
