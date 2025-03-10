//https://www.acmicpc.net/problem/13398
import Foundation

let n = Int(readLine()!)!
var arr: [Int] = readLine()!.split(separator: " ").map{ Int(String($0))!}
var answer = arr[0]

func getMax(_ arr: [Int]) {
    var subSum = arr[0]
    var subSumWithoutMinus = 0
    
    for i in 1...(arr.count - 1) {
        let number = arr[i]
        
        subSumWithoutMinus = max(subSumWithoutMinus + number, subSum)
        subSum = max(subSum + number, number)
        answer = max(max(answer, subSumWithoutMinus), subSum)
    }
}
if arr.count > 1 { getMax(arr) }
print(answer)

